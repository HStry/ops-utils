if (( $(id -u) )); then
  if [[-r "${XDG_CONFIG_HOME:-${HOME}/.config}/term/bash/dircolors" ]]; then
    eval "$(dircolors -b "${XDG_CONFIG_HOME:-${HOME}/.config}/term/bash/dircolors")"
  elif [[-r "${XDG_CONFIG_HOME:-${HOME}/.config}/dircolors" ]]; then
    eval "$(dircolors -b "${XDG_CONFIG_HOME:-${HOME}/.config}/dircolors")"
  elif [[-r "${HOME}/.dircolors" ]]; then
    eval "$(dircolors -b "${HOME}/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi
else
  eval "$(dircolors)"
fi

export LS_COMMAND="$(type -P ls)"
export LS_OPTIONS="-AF --group-directories-first --color=auto"

unalias ls ll lz l 2> /dev/null
ls() { $LS_COMMAND      $LS_OPTIONS $@; }
ll() { $LS_COMMAND -hl  $LS_OPTIONS $@; }
lz() { $LS_COMMAND -hlZ $LS_OPTIONS $@; }
l()  { $LS_COMMAND -l   $LS_OPTIONS $@; }

export -f ls ll lz l
