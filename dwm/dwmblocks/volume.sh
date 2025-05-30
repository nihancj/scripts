#!/bin/sh


case $BLOCK_BUTTON in
        1) volnoti -a ;;
        3) "$TERMINAL" -e pulsemixer; pkill -RTMIN+4 dwmblocks ;;
esac

volume="$(pactl -- get-sink-volume 0 | grep -o "[0-9]*%")"
volume=${volume%%\%*}

if pactl -- get-sink-mute 0 | grep -q 'yes' 2>/dev/null ; then
    volicon=""
elif [ $volume -ge 100 ] ; then
    volicon=""
elif [ $volume -ge 50 ] ; then
    volicon=""
elif [ $volume -gt 0 ] ; then
    volicon=""
elif [ $volume -eq 0 ] ; then
    volicon=""
fi
printf "%s%s\n" " $volicon $volume"
## an unknown icon for volume -gt 50 "墳"
