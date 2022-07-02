#!/bin/sh


# Show wifi 📶 and percent strength or 📡 if none.

case $BLOCK_BUTTON in
    1) "$HOME/scripts/dwm/dwmblocks/internet-notify.sh";;
	3) "$TERMINAL" -e nmtui; pkill -RTMIN+3 dwmblocks ;;
    2) "$TERMINAL";;
esac


if grep -xq 'up' /sys/class/net/w*/operstate 2>/dev/null ; then
    wifiicon=
elif grep -xq 'down' /sys/class/net/w*/operstate 2>/dev/null ; then
    grep -xq '0x1003' /sys/class/net/w*/flags && wifiicon= || wifiicon=❌
fi


printf "%s%s%s" "$(sed "s/.*/ /" /sys/class/net/tun*/operstate 2>/dev/null)" "$(sed "s/down//;s/up/ /" /sys/class/net/e*/operstate 2>/dev/null)" "$wifiicon"
#❌
#:
#:
#❎
#🌐
#🔒
