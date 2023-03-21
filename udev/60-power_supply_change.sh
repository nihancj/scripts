#!/bin/sh

# This script is to be executed by the file
# /etc/udev/rules.d/60-power_supply_change.rules
pkill -RTMIN+2 dwmblocks
