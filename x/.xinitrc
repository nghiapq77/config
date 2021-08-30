#!/bin/sh

# NVIDIA graphic card only
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96

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
xcompmgr &

# Use xresources
xrdb $HOME/.local/config/x/Xresources &

# Sync mail
mailsync &

# Run dwm
exec dwm
