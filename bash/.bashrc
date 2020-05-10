### for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=10000

### enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### Exporting PS1
export PS1="\[\e]0;\u: \w\a\]\[\033[01;31m\][\[\033[01;32m\]\u \[\033[01;34m\]\w\[\033[01;31m\]]\[\033[00m\]\$ "

### Alias
alias la='ls -A'
alias jptnb="cd /home/oz/projects/jupyter/ && jupyter notebook"
alias upgrade="sudo apt update && sudo apt upgrade"
alias v="vim"
alias r="ranger ."
alias abn="cd /home/oz/projects/abnormality-detection && conda activate ml"
alias act="source venv/bin/activate"
alias tmres="bash /home/oz/.local/scripts/tmux/current-session.sh"
alias cyber="ssh cyber@10.0.11.84"
alias ubuntu="ssh ubuntu@10.0.11.69"
alias sshcyber="ssh -i ~/downloads/a haophan@203.205.26.244 -p 2020"

### Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto"

### Auto cd
shopt -s autocd

### fzf
# Setup fzf
if [[ ! "$PATH" == */home/oz/.local/src/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/oz/.local/src/fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "/home/oz/.local/src/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
source "/home/oz/.local/src/fzf/shell/key-bindings.bash"

### disable Ctrl-S, Ctrl-Q
stty -ixon
