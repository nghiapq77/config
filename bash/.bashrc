### for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

### enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### Setting PS1
export PS1="\[\e]0;\u: \w\a\]\[\033[01;31m\][\[\033[01;32m\]\u \[\033[01;34m\]\w\[\033[01;31m\]]\[\033[00m\]\$ "

### Aliases
alias la='ls -A'
alias v="nvim"
alias vf='nvim $(fzf)'
alias sv="sudo -E nvim"
alias g="git"
alias gc="git checkout"
alias gl="git log --graph --all"
alias gs="git status"
alias gf="git fetch"
alias gp="git pull"
alias r="ranger ."
alias act="source venv/bin/activate"
alias tmres="bash /home/oz/.local/scripts/tmux/current-session.sh"

### Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto"

### Auto cd
shopt -s autocd

### fzf
# Auto-completion
[[ $- == *i* ]] && source "/usr/share/fzf/completion.bash" 2> /dev/null

# Key bindings
source "/usr/share/fzf/key-bindings.bash"

### disable Ctrl-S, Ctrl-Q
stty -ixon

### Clear screen in vi mode
bind -m vi-insert "\C-l":clear-screen

### Conda
if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
    . "/opt/anaconda/etc/profile.d/conda.sh"
else
    export PATH="/opt/anaconda/bin:$PATH"
fi
