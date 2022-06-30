#! /bin/sh

xset dpms 180 180 180 &
($HOME/scripts/remap_keys.sh && sxhkd) &
$HOME/scripts/fix_touchpad.sh &
$HOME/scripts/disable_autologin.sh &

#xwallpaper --zoom $HOME/.config/wallpaper.img &
randombg "200" "-q" &
dwmblocks &
picom --experimental-backends &
# redshift -l "10.85:76.27" &
/usr/lib/lxpolkit/lxpolkit &
unclutter -idle 2 &

sleep 1s
pkill -RTMIN+1 dwmblocks
sleep 4s
pkill -RTMIN+2 dwmblocks
