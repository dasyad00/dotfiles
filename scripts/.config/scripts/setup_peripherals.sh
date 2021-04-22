# Keyboard
setxkbmap -layout us,ara -option "grp:caps_toggle,grp_led:caps"

# Logitech G403
xinput set-prop "Logitech G403 Prodigy Wired/Wireless Gaming Mouse" "libinput Accel Profile" "flat"
xinput set-prop "Logitech G403 Prodigy Wired/Wireless Gaming Mouse" "libinput Natural Scrolling Enabled" "0"

# X220 touchpad
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" "1"
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" "1"
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Natural Scrolling Enabled" "0"

# Thinkpad P1 touchpad
xinput set-prop "Synaptics TM3418-002" "libinput Natural Scrolling Enabled" "1"
xinput set-prop "Synaptics TM3418-002" "libinput Tapping Enabled" "1"
xinput set-prop "TPPS/2 ALPS TrackPoint" "libinput Natural Scrolling Enabled" "0"
