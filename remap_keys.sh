#! /bin/bash

# Waits until the keyboard is connected
for ((i = 0; i < 30; i++)); do
    xinput | grep -q "Logitech Wireless Keyboard" && break
    sleep 10
done

# loads keymaps from $file
# $file has:-
        #1 Alt_R key to Caps_Lock
        #2 Caps_Lock key to Escape
file="$HOME/.config/X11/Xmodmap"
[ -f $file ] || exit
xmodmap -e 'clear Lock'
xmodmap $file
