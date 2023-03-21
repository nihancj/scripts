#!/bin/zsh

title="Login"
text="Pick a Window Manager.\nDefault: $DEFAULT_WM_NAME"

# Create an array with KEY/VALUE pairs.
# The first ["KEY"] gives the display name.
# The second ="VALUE" gives the output value.
declare -A radiobox
radiobox[DWM]="dwm"
radiobox[Qtile]="qtile"
radiobox[Openbox]="openbox"


choices=()
# For bash, change (@k) to !
for key in "${(@k)radiobox[@]}"
do
	if [ $key = $DEFAULT_WM_NAME ]; then
		choices+=("${key}" "               (default)")
	else
		choices+=("${key}" "                        ")
	fi
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
