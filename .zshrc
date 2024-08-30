export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

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
alias gfo="git fetch origin"

# alias clear screen in terminal
alias cl="clear"

# Nvim alias
alias nv="nvim"

# rails alias
alias rdmr="rails db:migrate:reset"
alias gclf="git clean -f"
alias gstai="git stash --include-untracked"
alias be="bundle exec"
alias beru="bundle exec rubocop"
alias bers="bundle exec rspec"
alias berss="bundle exec rails s"
alias berc="bundle exec rails c"

alias tks='tmux kill-session -t'
alias tka='tmux kill-server'
alias dc='docker-compose -f docker-compose.yml'
alias start_redis='docker run -p 6379:6379 31f08b90668e'

#kubectl
alias k='kubectl'
alias kex='kubectl exec -i -t'
alias klo='kubectl logs -f'
alias kgpo='kubectl get pods'

# 
# eval `dircolors ~/.solarized/dircolors.ansi-dark`

# 
export DEFAULT_USER="$(whoami)"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
