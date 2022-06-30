#! /bin/sh

# generate pywal colorscheme based on the current wallpaper
wal -c
wal -i $HOME/.local/share/wallpaper.img
cp $HOME/.cache/wal/colors.Xresources $HOME/.local/share/Xresources/wal-colors
