#!/bin/sh

weston --xwayland &
WESTON_PID=$!
export WAYLAND_DISPLAY=wayland-1
sleep 2

waydroid show-full-ui &
WAYDROID_PID=$!

trap "waydroid session stop; kill $WESTON_PID; kill $WAYDROID_PID" EXIT

wait $WESTON_PID
