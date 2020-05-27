#!/bin/sh

## Gnome keyring for mailspring
#dbus-update-activation-environment --systemd DISPLAY
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

# Status bar
dwmblocks &

# Start daemon
xwallpaper --zoom $HOME/.local/config/wall.png &
remaps &
sxhkd &
ibus-daemon -drx
dunst &
xcompmgr &
libinput-gestures &

# Use xresources
xrdb $HOME/.local/config/Xresources &

# For brightness 
sudo chmod 777 /sys/class/backlight/intel_backlight/brightness

# Sync mail
mailsync &

# Run dwm
exec dwm
