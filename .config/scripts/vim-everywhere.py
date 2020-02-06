from xkeysnail.transform import *

define_keymap(lambda wm_class: wm_class not in ('URxvt'), {
    #K('Capslock') : {
    #    K("F") : K("C-right"),
    #    K("B") : K("C-left")
    #}
    #K("C-F") : K("C-right"),
    #K("C-B") : K("C-left")
    K('Capslock') : escape_next_key,
    K("Capslock-F") : [set_mark(False), K("C-right")],
    K("Capslock-B") : [set_mark(True), K("C-left")]
}, 'Vim-everywhere')
