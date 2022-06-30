#! /bin/sh

# Get volume level and select an appropriate icon
volume="${1:-$(pactl -- get-sink-volume 0 | grep -o "[0-9]*%")}"
[ -z $1 ] && volume=${volume%%\%*}
[ "$volume" -lt "50" ] && icon="solid/volume-low" || icon="solid/volume-high"

# Check wheather the audio is muted and change the icon
pactl -- get-sink-mute 0 | grep -oq "yes" 2> /dev/null && icon="solid/volume-xmark"

# send notification
dunstify -t 2000 -i "$icon" -h string:x-canonical-private-synchronous:audio "Volume: $volume%" -h int:value:"$volume"
