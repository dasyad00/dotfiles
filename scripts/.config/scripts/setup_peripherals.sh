#!/bin/bash

# Keyboard
setxkbmap -layout us,ara -option "grp:caps_toggle,grp_led:caps"

# Logitech G403
ids=$(xinput --list | grep 'Logitech G403 Prodigy Wired/Wireless Gaming Mouse' | awk '{print $9}' | cut -d'=' -f2 | sed 's/[^0-9]*//g')

for i in $ids; do
    xinput set-prop $i "libinput Accel Profile Enabled" 0, 1
    xinput set-prop $i "libinput Natural Scrolling Enabled" "0"
done

# X220 touchpad
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" "1"
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" "1"
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Natural Scrolling Enabled" "0"

# Thinkpad P1 touchpad
xinput set-prop "Synaptics TM3418-002" "libinput Natural Scrolling Enabled" "1"
xinput set-prop "Synaptics TM3418-002" "libinput Tapping Enabled" "1"
xinput set-prop "TPPS/2 ALPS TrackPoint" "libinput Natural Scrolling Enabled" "0"
