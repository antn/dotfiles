setopt PROMPT_SUBST
prompt_char="⊙"

alias glog="git log --color --oneline"
alias gl="glog --graph"
alias r="bundle exec rails"
alias ..="cd .."
alias gco="git checkout "

if (( $+commands[rbenv] ))
then
  eval "$(rbenv init -)"
fi

current_ruby() {
  if (( $+commands[rbenv] ))
  then
    VERSION=$(rbenv version | head -n1 | awk '{print $1;}')
    echo " %F{red}$VERSION%f"
  fi
}

current_branch() {
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return
  echo " %F{cyan}${ref#refs/heads/}%f"
}

export TERM="xterm-256color"
export CLICOLOR=1
export PROMPT='%B%F{yellow}%~%f$(current_branch)$(current_ruby) %F{green}${prompt_char}%f%b '
