#!/bin/sh

# Status bar
dwmblocks &

# Start daemon
xwallpaper --zoom $HOME/.local/config/wall.png &
remaps &
sxhkd &
ibus-daemon -drx
dunst &
xcompmgr &

# Use xresources
xrdb $HOME/.local/config/x/Xresources &

# For brightness 
sudo chmod 446 /sys/class/backlight/intel_backlight/brightness

# Sync mail
mailsync &

# Run dwm
exec dwm
