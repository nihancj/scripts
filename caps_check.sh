#!/bin/sh

sleep 0.25
if xset q | grep -qo "Caps\s*Lock:\s*on"; then
	notify-send -t 300000 "Caps Lock ON" "press $caps_key" &
else
	dunstctl close-all 2>/dev/null
fi
