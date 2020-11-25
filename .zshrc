export ZSH="/home/nguyen.van.linhc/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git rails ruby zsh-autosuggestions tmux)

source $ZSH/oh-my-zsh.sh

 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='vim'
 fi

# Git alias
alias gl1="git log --oneline --decorate --color"
alias gcm="git commit -m"
alias gcmn="git commit -v -a --no-edit --amend"
alias gcma="git commit -v --amend"

# alias clear screen in terminal
alias cl="clear"

# Nvim alias
alias nv="nvim"

# rails alias
alias rdmr="rails db:migrate:reset"
alias gclf="git clean -f"
alias gstai="git stash --include-untracked"
alias be="bundle exec"
alias ru="rubocop"
alias beru="bundle exec rubocop"
alias bers="bundle exec rspec"

# 
eval `dircolors ~/.solarized/dircolors.ansi-dark`

# 
export DEFAULT_USER="$(whoami)"

# 
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

