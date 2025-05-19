#!/bin/zsh

# Create an array with KEY/VALUE pairs.
# The first ["KEY"] gives the display name.
# The second ="VALUE" gives the output value.
declare -A radiobox
radiobox[DWM]="dwm"
radiobox[Qtile]="qtile"
radiobox[IceWM]="icewm"
radiobox[Openbox]="openbox"
radiobox[Hyprland]="/home/user/.config/hypr/initrc"
radiobox[River]="/home/user/.config/river/launch_script"
radiobox[Sway]="/bin/sway"
radiobox[quit]="quit"


if [ -z "$1" ]; then
	# For bash, change (@k) to !
	choices=()
	for key in "${(@k)radiobox[@]}"
	do
		choices+=("${key}")
	done
	choice=$(printf '%s\n' "$choices[@]" |\
		fzf -i --no-mouse --prompt='Choose a session: ')
else
	choice="$1"
fi

# Execute
session="${radiobox[$choice]}"
if [ -f "$XINITRC.$session" ]; then
	# echo sx "$XINITRC.$session"
	echo dbus-run-session sx "$XINITRC.$session"
elif [ -f "$session" ]; then
	echo $session
fi
