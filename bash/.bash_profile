#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Global variables
export DWM_SCRIPTS="$HOME/.local/scripts/dwm"
export TERMINAL="st"
export BROWSER="brave"
export EDITOR="vim"
export WALLPAPER="/home/oz/pics/wall.png"
export XRESOURCES="/home/oz/.config/Xresources"

# set PATH so it includes personal scripts if exists
if [ -d $DWM_SCRIPTS ] ; then
    PATH="$DWM_SCRIPTS:$PATH"
fi

# Cleanup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export KDEHOME="$XDG_CONFIG_HOME"/kde
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc-2.0
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx
