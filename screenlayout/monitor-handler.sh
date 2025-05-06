#!/bin/bash

export DISPLAY=:1
export XAUTHORITY=/home/spunker/.Xauthority


LOGFILE="/home/spunker/.screenlayout/monitor.log"

# List of interfaces to check
INTERFACES=("DisplayPort-1")

CONNECTED=false

for iface in "${INTERFACES[@]}"; do
    if xrandr | grep "$iface connected"; then
        CONNECTED=true
        break
    fi
done

if $CONNECTED; then
    echo "$(date): External monitor connected (one of: ${INTERFACES[*]})" >> "$LOGFILE"
    sh /home/spunker/.screenlayout/extend.sh
else
    echo "$(date): All external monitors disconnected" >> "$LOGFILE"
    sh /home/spunker/.screenlayout/single.sh
fi
