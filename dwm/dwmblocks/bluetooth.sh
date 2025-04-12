#!/bin/sh

doas sv check bluetoothd | grep -qw "down:" && exit 1
var="$(bluetoothctl devices Connected)"
[ "$var" ] && printf " "

case $BLOCK_BUTTON in
	1) connected="$(bluetoothctl devices Connected | cut -d' ' -f 3-)";
		notify-send -t 5000 -i "/usr/share/icons/Adwaita/32x32/status/bluetooth-active-symbolic.symbolic.png" "Connected devices:" "$connected";
	3) bluetooth-dm;;
    2) "$TERMINAL" -e bluetoothctl;;
esac
