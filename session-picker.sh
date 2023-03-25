#!/bin/zsh

title="Session Manager"
text="Pick a Session.\nDefault: $DEFAULT_SESSION_NAME"

# Create an array with KEY/VALUE pairs.
# The first ["KEY"] gives the display name.
# The second ="VALUE" gives the output value.
declare -A radiobox
radiobox[DWM]="dwm"
radiobox[Qtile]="qtile"
radiobox[Openbox]="openbox"
radiobox[Hyprland]="Hyprland"


# For bash, change (@k) to !
choices=()
[[ -z ${(@k)radiobox[$DEFAULT_SESSION_NAME]} ]] || \
choices+=("$DEFAULT_SESSION_NAME" "               (default)")
for key in "${(@k)radiobox[@]}"
do
	[ "$key" = "$DEFAULT_SESSION_NAME" ] && continue
	choices+=("${key}" "                        ")
done

# Creates the whiptail checklist
result=$(
	whiptail --nocancel --title $title \
	--menu "$text" 22 78 12 \
	"${choices[@]}" \
	3>&2 2>&1 1>&3
)

# Output
printf "${radiobox[$result]}"
