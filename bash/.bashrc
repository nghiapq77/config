### If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Enable history appending instead of overwriting when exiting
shopt -s histappend

### Auto cd
shopt -s autocd

### disable Ctrl-S, Ctrl-Q
stty -ixon

### For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=50000

### Use bash-completion if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# Use bash-completion for git if available
[[ $PS1 && -f /usr/share/bash-completion/completions/git ]] && . /usr/share/bash-completion/completions/git

### Setting PS1
export PS1="\[\e]0;\u: \w\a\]\[\033[01;31m\][\[\033[01;32m\]\u \[\033[01;34m\]\w\[\033[01;31m\]]\[\033[00m\]\$ "

### Aliases
alias la='ls -A'
alias lA='ls -lA'
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
alias yaya="yay -Syua"
alias i="ip -br -c a"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias rsync="rsync -Prv"
alias c="clear"

# Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto"

### fzf
# Source auto-completion and key bindings
[[ $- == *i* ]] && source "/usr/share/fzf/completion.bash" 2> /dev/null; source "/usr/share/fzf/key-bindings.bash"

### Conda
if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
    . "/opt/anaconda/etc/profile.d/conda.sh"
else
    export PATH="/opt/anaconda/bin:$PATH"
fi

### Autojump
source "/etc/profile.d/autojump.bash"
