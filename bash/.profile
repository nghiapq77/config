# Source bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Global variables
export TERMINAL="st"
export BROWSER="firefox"
export EDITOR="nvim"

# Set PATH so it includes personal scripts, also check $TMUX to prevent duplicate paths
[[ -z $TMUX ]] && export PATH="$(find ~/.local/bin -type d -not -iwholename '*.git*' -printf %p:)$PATH"

# Cleanup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export HISTFILE="$XDG_CACHE_HOME"/bash/history
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc-2.0
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/pass"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export MBSYNCRC="${XDG_CONFIG_HOME:-$HOME/.config}/isync/mbsyncrc"
export MPOPRC="${XDG_CONFIG_HOME:-$HOME/.config}/mpop/config"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NLTK_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/nltk_data"

# Windows scaling
export GDK_DPI_SCALE=1.25
export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=1.25
export QT_FONT_DPI=96

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx
