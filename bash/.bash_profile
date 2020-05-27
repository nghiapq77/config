# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Global variables
export SCRIPTS="$HOME/.local/scripts"
export TERMINAL="st"
export BROWSER="brave"
export EDITOR="vim"

# set PATH so it includes personal scripts
PATH="$SCRIPTS:$PATH"

# Cleanup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
#export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc-2.0
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# For Android Studio
export _JAVA_AWT_WM_NONREPARENTING=1
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx
