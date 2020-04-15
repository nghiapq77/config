# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=10000

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# exporting
export PS1="\[\e]0;\u: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\e[31m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"

# Alias
alias la='ls -A'
alias ps1="PS1='\[\033[01;34m\]\W\[\033[00m\]\$ '"
alias jptnb="cd /home/oz/projects/jupyter/ && jupyter notebook"
alias upgrade="sudo apt update && sudo apt upgrade"
alias v="vim"
alias r="ranger ."
alias cyber="ssh cyber@10.0.11.84"
alias sshcyber="ssh -i ~/.ssh/id_rsa nghiapham@203.205.26.244 -p 2020"
alias abn="cd /home/oz/projects/abnormality-detection && conda activate ml"
alias act="source venv/bin/activate"

# Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi"
alias tmux-restore="bash /home/oz/.local/scripts/tmux/current-session.sh"

# Auto cd
shopt -s autocd

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# disable Ctrl-S, Ctrl-Q
stty -ixon

