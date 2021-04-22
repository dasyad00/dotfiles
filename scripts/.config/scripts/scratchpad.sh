#!/bin/sh
bspc query -N -n .floating > /tmp/scratchid
cd $HOME
tmux new-session -A -s scratch
$SHELL
