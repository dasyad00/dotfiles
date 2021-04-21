#!/bin/sh

# Check if scratchpad is already active
if [ -s "/tmp/scratchid" ]
then
    echo "Scratchpad already running"
else
    echo "Running scratchpad..."
    urxvt -name scratchpad -e ~/.config/scripts/scratchpad.sh &
fi
