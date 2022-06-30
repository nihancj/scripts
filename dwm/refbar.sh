#! /bin/sh
tree="$(pstree -lp | grep -o "statusbar.sh([0-9]\+)---sleep([0-9]\+")"
kill "${tree##*(}"
