#!/bin/sh

# Remap key, run hotkey daemon
remaps &
sxhkd &

# Status bar
dwmblocks &

# Wallpaper
xwallpaper --zoom $HOME/.local/config/wall.png &

# ibus
ibus-daemon -drx

# notifications
dunst &

# compositor
picom &

# unclutter
unclutter &

# Use xresources
xrdb $HOME/.local/config/x/Xresources &

# Run dwm
exec dwm
