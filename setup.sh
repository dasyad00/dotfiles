#!/usr/bin/env bash
# https://dev.to/writingcode/how-i-manage-my-dotfiles-using-gnu-stow-4l59

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

# what directories should be installable by all users including the root user
base=(
	bash
    compton
)

# folders that should, or only need to be installed for a locla user
useronly=(
	bash
	bspwm
    dunst
	git
	gtk
	#i3wm
	ideavim
	polybar
	ranger
    rofi
	scripts
	#tmux
	vim
	X
)

# run the stow command foor the passed in directory ($2) in location $1
stowit() {
	usr=$1
	app=$2
	# -v verbose
	# -R recursive
	# -t target
	stow -v -R -t ${usr} ${app}
}

echo ""
echo "Stowing apps for user: ${whoami}"

# install apps available to local users and root
for app in ${base[@]}; do
	stowit "${HOME}" $app
done

# install only user space folders
for app in ${useronly[@]}; do
	if [[ ! "$(whoami)" = *"root"* ]]; then
		stowit "${HOME}" $app
	fi
done

# copy xorg settings
echo "copying xorg.conf.d config..."
sudo cp ./xorg.conf.d/* /etc/X11/xorg.conf.d/

echo ""
echo "##### ALL DONE"
