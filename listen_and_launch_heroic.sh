#!/bin/sh

# Define the joystick input device (you might need to adjust this)
JOYSTICK_DEVICE="$(evdev-joystick --l)"
[ -z $JOYSTICK_DEVICE ] && exit 1

# Monitor joystick events
evtest $JOYSTICK_DEVICE | while read -r line; do
    # Check if the event corresponds to a button press (button down)
    if echo "$line" | grep -Fq "code 316 (BTN_MODE), value 1"; then
		exec /home/user/scripts/launch_and_listen_heroic.sh
    fi
done
