ZSH=$HOME/.oh-my-zsh
ZSH_THEME="typewritten"

export EDITOR=nvim
export LC_ALL='en_US.UTF-8'
export TERM=xterm-256color
DISABLE_UPDATE_PROMPT=true

plugins=(
  bundler
  docker
  docker-compose
  fzf
  git
  rails
  you-should-use
  zsh-syntax-highlighting
  $plugins)

# config for typewritten
export TYPEWRITTEN_LEFT_PROMPT_PREFIX_FUNCTION=(date +%H:%M:%S)
export TYPEWRITTEN_DISABLE_RETURN_CODE=true

# config for spaceship
export SPACESHIP_TIME_SHOW=true
export SPACESHIP_PACKAGE_PREFIX="via·"
export SPACESHIP_PACKAGE_SUFFIX=" "
export SPACESHIP_PACKAGE_COLOR="green"

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
unsetopt share_history

source $ZSH/oh-my-zsh.sh

alias bua='brew update && brew upgrade && brew cleanup'
alias buc='brew upgrade --cask --greedy'

alias top='htop'
alias t='tmux'
alias j='cd /Users/badta5te/Documents/Projects'
alias c='clear'
alias lg='lazygit'
alias ld='lazydocker'
alias ls='eza'

source /Users/badta5te/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autocompetition for 1password-cli
eval "$(op completion zsh)"; compdef _op op

# for brew python@3.10
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

#for zoxide
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath=($fpath "/Users/badta5te/.zfunctions")

export PATH="$HOME/.local/bin:$PATH"

# eval "$(~/.local/bin/mise activate zsh)"
eval "$(mise activate zsh)"

# for rubymine
export PATH="/Applications/RubyMine.app/Contents/MacOS:$PATH"

# Added by Antigravity
export PATH="/Users/badta5te/.antigravity/antigravity/bin:$PATH"

# completions for eza
export FPATH="/opt/homebrew/bin/eza/completions/zsh:$FPATH"
