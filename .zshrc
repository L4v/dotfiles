export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH=/Users/jovan/.local/bin:$PATH

alias be="source ~/.scripts/be.sh"
alias fe="source ~/.scripts/fe.sh"
alias admin="source ~/.scripts/admin.sh"
alias lvide='~/.scripts/lvide.sh'


setopt PROMPT_SUBST
check_git_dirty() {
  [[ $(git status --porcelain 2> /dev/null) != "" ]]
}


parse_git_dirty() {
    check_git_dirty && echo "*"
}
parse_git_branch() {
  local branch=$(git symbolic-ref HEAD 2> /dev/null | sed 's!refs/heads/!!')
  if [[ -n $branch ]]; then
    echo " → $branch$(parse_git_dirty)"
  fi
}

# Set the prompt with zsh color escapes
PROMPT='%n@%m[%F{green}%~%f$(parse_git_branch)]$ '
