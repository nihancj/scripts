#! /bin/sh

delim="|"


#vpn(){
#        if [ "$(nmcli connection show --active | grep 'vpn')" ]; then
#            vpn="$(nmcli connection show --active | awk 'FNR == 2 {print substr($1,0,2)"-"substr($1,9,2)}')"
#            printf " $vpn  |"
#        fi
# 
#}
status(){
        # Audio
        volume="$(pactl -- get-sink-volume 0 | grep -o "[0-9]*%")"
        echo " ${volume%%\%*}" && echo $delim

        # Wifi and Ethernet
        [ "$(cat /sys/class/net/enp3s0/operstate)" = "up" ] && printf " " && connected=1
        [ "$(cat /sys/class/net/wlp2s0/operstate)" = "up" ] && printf " " && connected=1
        [ $connected ] && echo $delim

        # Battery percentage
        /home/user/.local/share/dwm/i3blocks/battery && echo " $delim"

        # Date and time
        date '+%b %d (%a) %I:%M'
        }

while :; do
        xsetroot -name " $(status | tr '\n' ' ')"
        sleep 1m
done
