#!/bin/sh
bspc query -N -n .floating > /tmp/scratchid
tmux new-session -A -s scratch
$SHELL
