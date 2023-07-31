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
alias tp='trash-put'
alias rc='rclone'

export EDITOR='vim'
export NNN_OPTS="u"
export NNN_TRASH=1 # trash-cli

pd() {
  if [[ -n "$1" ]]; then
    pushd "$@"
  else
    popd
  fi
}

mcd () {
  mkdir "$@"
  cd "${@: -1}"
}

# https://github.com/jarun/nnn/wiki/Basic-use-cases#configure-cd-on-quit
n () {
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
  PS1='${debian_chroot:+($debian_chroot)}[\W]$(__git_ps1 " (%s)")\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}[\W]\$ '
fi

if [ -f ~/.bashrclocal ]; then
    source ~/.bashrclocal
fi
