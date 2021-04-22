#!/bin/sh
DEFAULT_GAP=12
OLD_GAP=$(bspc config window_gap)

if [[ $OLD_GAP -eq $DEFAULT_GAP ]]; then
    bspc config window_gap 0
else
    bspc config window_gap $DEFAULT_GAP
fi
