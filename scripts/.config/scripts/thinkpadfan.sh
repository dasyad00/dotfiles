#!/bin/bash

# If no arguments

if [ "$1" != "" ]
    then
        FANSPEED=$1
    else
        echo "Write the fan speed you would like to use"
        read FANSPEED
fi

echo level ${FANSPEED} | sudo tee /proc/acpi/ibm/fan

echo "Fan speed changed to ${FANSPEED}"
