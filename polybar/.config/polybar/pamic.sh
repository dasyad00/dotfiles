#!/usr/bin/env bash

# finds the active source for pulse audio

osd='no'
#inc='2'
capvol='no'
maxvol='200'
autosync='yes'

# Muted status
# yes: muted
# no : not muted
curStatus="no"
active_source=""
limit=$((100 - inc))
maxlimit=$((maxvol - inc))

reloadSource() {
    active_source=$(pacmd list-sources | awk '/* index:/{print $3}')
}


function getSourceOutputs {
    input_array=$(pacmd list-source-outputs | grep -B 4 "source: $1 " | awk '/index:/{print $2}')
}

function volSync {
    getSourceOutputs "$active_source"
    getCurVol

    for each in $input_array
    do
        pactl set-source-output-volume "$each" "$curVol%"
    done
}

function getCurVol {
    curVol=$(pacmd list-sources | grep -A 15 "index: $active_source$" | grep 'volume:' | grep -E -v 'base volume:' | awk -F : '{print $3}' | grep -o -P '.{0,3}%'| sed s/.$// | tr -d ' ')
}

function micMute {
    case "$1" in
        mute)
            pactl set-source-mute "$active_source" 1
            curVol=0
            status=1
            ;;
        unmute)
            pactl set-source-mute "$active_source" 0
            getCurVol
            status=0
            ;;
    esac

    # TODO fix
    #if [ ${osd} = 'yes' ]
    #then
        #qdbus org.kde.kded /modules/kosd showVolume ${curVol} ${status}
    #fi
}

function volMuteStatus {
    curStatus=$(pacmd list-sources | grep -A 15 "index: $active_source$" | awk '/muted/{ print $2}')
}

# Prints output for bar
# Listens for events for fast update speed
function listen {
    firstrun=0

    pactl subscribe 2>/dev/null | {
        while true; do 
            {
                # If this is the first time just continue
                # and print the current state
                # Otherwise wait for events
                # This is to prevent the module being empty until
                # an event occurs
                if [ $firstrun -eq 0 ]
                then
                    firstrun=1
                else
                    read -r event || break
                    if ! echo "$event" | grep -e "on card" -e "on source"
                    then
                        # Avoid double events
                        continue
                    fi
                fi
            } &>/dev/null
            output
        done
    }
}

function output() {
    reloadSource
    getCurVol
    volMuteStatus
    if [ "${curStatus}" = 'yes' ]
    then
        #echo " MUTE"
#        echo " $curVol%"
        # mute
        #echo " "
        echo " "
    else
        #echo " $curVol%"
        # microphone
        echo "  "


    fi
}

reloadSource
case "$1" in
    --up)
        volUp
        ;;
    --down)
        volDown
        ;;
    --togmute)
        volMuteStatus
        if [ "$curStatus" = 'yes' ]
        then
            micMute unmute
        else
            micMute mute
        fi
        ;;
    --mute)
        micMute mute
        ;;
    --unmute)
        micMute unmute
        ;;
    --sync)
        volSync
        ;;
    --listen)
        # Listen for changes and immediately create new output for the bar
        # This is faster than having the script on an interval
        listen
        ;;
    *)
        # By default print output for bar
        output
        ;;
esac
