setopt PROMPT_SUBST
prompt_char="⊙"

alias glog="git log --color --oneline"
alias gl="glog --graph"
alias r="bundle exec rails"
alias ..="cd .."
alias gco="git checkout "
alias mysql57="mysqlv mysql@5.7"
alias mysql80="mysqlv mysql"

mysqlv() {
  brew services stop mysql
  brew services stop mysql@5.7
  brew unlink mysql mysql@5.7
  brew link --force --overwrite $1
  brew services start $1
}

if (( $+commands[rbenv] ))
then
  eval "$(rbenv init -)"
fi

current_ruby() {
  if (( $+commands[rbenv] ))
  then
    echo $(rbenv version | head -n1 | awk '{print $1;}')
  fi
}

current_branch() {
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

export TERM="xterm-256color"
export CLICOLOR=1
export PROMPT='%B%F{yellow}%~%f %F{cyan}$(current_branch)%f %F{red}$(current_ruby)%f %F{green}${prompt_char}%f%b '
