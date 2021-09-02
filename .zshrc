setopt PROMPT_SUBST
prompt_char="⊙"

alias glog="git log --color --oneline"
alias gl="glog --graph"
alias r="bundle exec rails"
alias ..="cd .."
alias gco="git checkout "

eval "$(rbenv init -)"

current_ruby() {
  echo $(rbenv version | head -n1 | awk '{print $1;}')
}

current_branch() {
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

export TERM="xterm-256color"
export CLICOLOR=1
export PROMPT='%B%F{yellow}%~%f %F{cyan}$(current_branch)%f %F{red}$(current_ruby)%f %F{green}${prompt_char}%f%b '
