HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias n='nnn'
alias tp='trash-put'

export EDITOR='vim'
export NNN_TRASH=1 # trash-cli

mcd () {
  mkdir "$@"
  cd "${@: -1}"
}

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

export PS1='${debian_chroot:+($debian_chroot)}[\W]\$ '

if [ -f ~/.bashrclocal ]; then
    source ~/.bashrclocal
fi
