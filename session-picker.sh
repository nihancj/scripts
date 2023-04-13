#!/bin/zsh

title="Session Manager"
text="Pick a Session.\nDefault: $DEFAULT_SESSION_NAME"

# Create an array with KEY/VALUE pairs.
# The first ["KEY"] gives the display name.
# The second ="VALUE" gives the output value.
declare -A radiobox
radiobox[DWM]="dwm"
radiobox[Qtile]="qtile"
radiobox[IceWM]="icewm"
radiobox[Openbox]="openbox"
radiobox[Hyprland]="Hyprland"


# For bash, change (@k) to !
choices=()
for key in "${(@k)radiobox[@]}"
do
	choices+=("${key}")
done
choice=$(printf '%s\n' "$choices[@]" |\
   	fzf -i --no-mouse --prompt='Choose a session: ')

# Output
printf "${radiobox[$choice]}"
