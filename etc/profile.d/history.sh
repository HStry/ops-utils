shopt -s histappend

if [[ -f "${XDG_CONFIG_HOME:-${HOME}/.config}/term/bash/history" ]]; then
  HISTFILE="${XDG_CONFIG_HOME:-${HOME}/.config}/term/bash/history"
elif [[ -f "${XDG_CONFIG_HOME:-${HOME}/.config}/bash_history" ]]; then
  HISTFILE="${XDG_CONFIG_HOME:-${HOME}/.config}/bash_history"
elif [[ -f "${HOME}/.bash_history" ]]; then
  HISTFILE="${HOME}/.bash_history"
elif [[ -d "${XDG_CONFIG_HOME:-${HOME}/.config}/term/bash" ]]; then
  HISTFILE="${XDG_CONFIG_HOME:-${HOME}/.config}/term/bash/history"
elif [[ -d "${XDG_CONFIG_HOME:-${HOME}/.config}" ]]; then
  HISTFILE="${XDG_CONFIG_HOME:-${HOME}/.config}/bash_history"
else
  HISTFILE="${HOME}/.bash_history"
fi

HISTFILESIZE=0
HISTSIZE=2000
HISTCONTROL=ignorespace:ignoredups
HISTTIMEFORMAT="[%Y-%m-%d (%a) %H:%M] "
if [[ -n "$PROMPT_COMMAND" ]]; then
  PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
else
  PROMPT_COMMAND="history -a; history -n"
fi

export HISTFILE \
       HISTFILESIZE \
       HISTSIZE \
       HISTCONTROL \
       HISTTIMEFORMAT \
       PROMPT_COMMAND
