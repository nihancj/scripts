#!/bin/sh

wifi="$(nmcli con show --active | grep "wifi")"
eth="$(nmcli con show --active | grep "ethernet")"
vpn="$(nmcli con show --active | grep -i "vpn")"


[ "$wifi" != "" ] && wifi="WiFi : "${wifi%% *}"" && internet=1
[ "$eth" != "" ] && eth="Eth  : Connected" && internet=1
[ "$vpn" != "" ] && vpn="VPN  : Conneted"

[ $internet ] && internet="Internet Access Available" || internet="No Internet Access"

notify-send -h string:x-canonical-private-synchronous:audio "$internet" "$wifi\n$eth\n$vpn"
