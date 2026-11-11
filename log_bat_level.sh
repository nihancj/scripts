#!/usr/bin/sh
date "+[%Y-%m-%d %H:%M:%S] $1 $(cat /sys/class/power_supply/BAT0/capacity) $(cat /sys/class/power_supply/BAT0/status)"
