#!/bin/sh

case $BLOCK_BUTTON in
        1) batnoti ;;
esac

battery="/sys/class/power_supply/BAT0"
capacity=$(cat "$battery"/capacity) || exit
stat=$(cat "$battery"/status)
icon=''

if [ "$stat" = "Discharging" ]; then
	if [ "$capacity" -eq "5" ]; then
		bat-low-notify "$capacity" &
		sleep 3 && loginctl hibernate &
		icon=''
	elif [ "$capacity" -lt "25" ]; then
		bat-low-notify "$capacity" &
		icon=''
	elif [ "$capacity" -lt "50" ]; then
		icon=''
	elif [ "$capacity" -le "75" ]; then
		icon=''
	elif [ "$capacity" -le "100" ]; then
		icon=''
	fi
elif [ "$stat" = "Charging" ]; then
	icon=''
	[ "$capacity" -eq "100" ] && icon=''
	# if [ "$capacity" -gt "75" ]; then
	# 	bat-low-notify "$capacity" &
	# fi
else
	icon=''
fi

printf "%s" "$capacity% $icon"
