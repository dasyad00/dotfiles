# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import *
import ranger.core.linemode

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

# You can import any python module as needed.
import os

# Any class that is a subclass of "Command" will be integrated into ranger as a
# command.  Try typing ":my_edit<ENTER>" in ranger!

# TODO make this work
class MyLinemode(ranger.core.linemode.LinemodeBase):
    name = "overthink_linemode"

    uses_metadata = True
    required_metadata = ["comment"]

    def filetitle(self, file, metadata):
        return file.relative_path + " (" + metadata.comment + ")"

    def infostring(self, file, metadata):
        return file.user


class my_edit(Command):
    # The so-called doc-string of the class will be visible in the built-in
    # help that is accessible by typing "?c" inside ranger.
    """:my_edit <filename>

    A sample command for demonstration purposes that opens a file in an editor.
    """

    # The execute method is called when you run this command in ranger.
    def execute(self):
        # self.arg(1) is the first (space-separated) argument to the function.
        # This way you can write ":my_edit somefilename<ENTER>".
        if self.arg(1):
            # self.rest(1) contains self.arg(1) and everything that follows
            target_filename = self.rest(1)
        else:
            # self.fm is a ranger.core.filemanager.FileManager object and gives
            # you access to internals of ranger.
            # self.fm.thisfile is a ranger.container.file.File object and is a
            # reference to the currently selected file.
            target_filename = self.fm.thisfile.path

        # This is a generic function to print text in ranger.
        self.fm.notify("Let's edit the file " + target_filename + "!")

        # Using bad=True in fm.notify allows you to print error messages:
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        # This executes a function from ranger.core.acitons, a module with a
        # variety of subroutines that can help you construct commands.
        # Check out the source, or run "pydoc ranger.core.actions" for a list.
        self.fm.edit_file(target_filename)

    # The tab method is called when you press tab, and should return a list of
    # suggestions that the user will tab through.
    # tabnum is 1 for <TAB> and -1 for <S-TAB> by default
    def tab(self, tabnum):
        # This is a generic tab-completion function that iterates through the
        # content of the current directory.
        return self._tab_directory_content()

class change_ext(Command):
    """change_ext <new_extension>
    
    Uses ffmpeg to change the extensions of media files
    """

    def execute(self):  # pylint: disable=too-many-locals,too-many-statements
        if self.arg(1):
            import sys
            import tempfile
            from ranger.container.file import File
            from ranger.ext.shell_escape import shell_escape as esc
            py3 = sys.version_info[0] >= 3

            # Create and edit the file list
            filenames = [f.relative_path for f in self.fm.thistab.get_selection()]
            listfile = tempfile.NamedTemporaryFile(delete=False)
            listpath = listfile.name

            new_ext = self.rest(1).split()[0]

            if py3:
                listfile.write("\n".join(filenames).encode("utf-8"))
            else:
                listfile.write("\n".join(filenames))
            listfile.close()
            #self.fm.execute_file([File(listpath)], app='editor')

            listfile = open(listpath, 'r')
            new_filenames = listfile.read().split("\n")
            listfile.close()
            os.unlink(listpath)
            for i in range(len(new_filenames)):
                new_filenames[i] = new_filenames[i][:new_filenames[i].rfind('.')] + '.' + new_ext
            if all(a == b for a, b in zip(filenames, new_filenames)):
                self.fm.notify("No renaming to be done!")
                return

            # Generate script
            cmdfile = tempfile.NamedTemporaryFile()
            script_lines = []
            script_lines.append("# This file will be executed when you close the editor.\n")
            script_lines.append("# Please double-check everything, clear the file to abort.\n")
            script_lines.extend("ffmpeg -i %s %s\n" % (esc(old), esc(new))
                                for old, new in zip(filenames, new_filenames) if old != new)
            script_content = "".join(script_lines)
            if py3:
                cmdfile.write(script_content.encode("utf-8"))
            else:
                cmdfile.write(script_content)
            cmdfile.flush()

            # Open the script and let the user review it, then check if the script
            # was modified by the user
            self.fm.execute_file([File(cmdfile.name)], app='editor')
            cmdfile.seek(0)
            script_was_edited = (script_content != cmdfile.read())

            # Do the converting
            self.fm.run(['/bin/sh', cmdfile.name], flags='w')
            cmdfile.close()

            # Retag the files, but only if the script wasn't changed during review,
            # because only then we know which are the source and destination files.
            if not script_was_edited:
                tags_changed = False
                for old, new in zip(filenames, new_filenames):
                    if old != new:
                        oldpath = self.fm.thisdir.path + '/' + old
                        newpath = self.fm.thisdir.path + '/' + new
                        if oldpath in self.fm.tags:
                            old_tag = self.fm.tags.tags[oldpath]
                            self.fm.tags.remove(oldpath)
                            self.fm.tags.tags[newpath] = old_tag
                            tags_changed = True
                if tags_changed:
                    self.fm.tags.dump()
            else:
                self.fm.notify("files have not been retagged")
        else:
            self.fm.notify("Insert a new extension!")
