#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=" "
playing=" "
paused=" "

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    #echo "%{F#D08770}$icon $metadata"       # Orange when playing
    echo "$playing $metadata"
elif [[ $player_status = "Paused" ]]; then
    #echo "%{F#65737E}$icon $paused $metadata"       # Greyed out info when paused
    echo "$paused $metadata"       # Greyed out info when paused
else
    echo ""                                 # No text when no music
  fi
