#!/bin/bash

# If no arguments

if [ "$1" != "" ]
    then
        ACCEL=$1
    else
        echo "Write the acceleration you would like to use"
        read ACCEL
fi

xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" ${ACCEL}

echo "Acceleration set to ${ACCEL}"
