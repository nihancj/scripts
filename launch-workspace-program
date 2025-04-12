#!/bin/sh

get_tag="$(dwm-msg get_monitors | grep -o "\"selected\": [0-9]*" | head -1)"
tag=${get_tag#* }
[ -z "$1" ] || tag=$((tag*10))
case $tag in
        1)  $TERMINAL &;;
        2)  $TERMINAL $EDITOR &;;
        4)  $TERMINAL &;;
        8)  $TERMINAL $FILEMANAGER &;;
        16) codium &;;
        32) $TERMINAL $(cat "$HOME/dmscripts/dmenu-custom/apps.d/youtube.cli") &;;
        128)/bin/sh < "$HOME/dmscripts/dmenu-custom/apps.d/WhatsApp.run" &;;
        256)$BROWSER &;;

        10)  exit;;
        20)  $TERMINAL $EDITORplus &;;
        40)  $TERMINALplus &;;
        80)  $FILEMANAGERplus &;;
        160) exit;;
        320) youtube-dm &;;
        2560)$BROWSERplus &;;
esac
