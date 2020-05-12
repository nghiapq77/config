#!/bin/sh

# set PATH so it includes personal scripts if exists
DWM_SCRIPTS="$HOME/.local/scripts/dwm"
export SCRIPTS="$HOME/.local/scripts"
if [ -d $DWM_SCRIPTS ] ; then
    PATH="$DWM_SCRIPTS:$PATH"
fi

# Gnome keyring for mailspring
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Status bar
dwmblocks &

# Start daemon
xwallpaper --zoom $WALLPAPER &
remaps &
sxhkd &
ibus-daemon -drx
dunst &
xcompmgr &
libinput-gestures &

# Use xresources
xrdb $XRESOURCES &

# For brightness hotkey
sudo chmod 777 /sys/class/backlight/intel_backlight/brightness

# Run dwm
exec dwm
