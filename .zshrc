# Load autocompletions
autoload -Uz compinit && compinit

alias gptk='gameportingtoolkit'
# Auto-switch brew versions
if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

# bun
export BUN_INSTALL="$HOME/Library/Application Support/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2024-06-14 08:24:13
export PATH="$PATH:/Users/mosguinz/.local/bin"

zstyle ':completion:*' menu select
fpath+=~/.zfunc

# ==================

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Oh my posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/default.toml)"
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# History search settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias cat='bat -p'
alias vim='nvim'
alias python='python3'
alias c='clear'
alias g='git'
alias z='zoxide'
alias brewarm='eval "$(/opt/homebrew/bin/brew shellenv)"'
alias brewx86='eval "$(/usr/local/bin/brew shellenv)"'

# FZF and zoxide integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Pipx autocomplete
eval "$(register-python-argcomplete pipx)"

# Pyenv autocomplete
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Docker
fpath=(~/.docker/completions \\$fpath)

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PI25_MAC=e4:5f:01:f4:59:00
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"
FNM_PATH="/Users/mosguinz/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/mosguinz/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

# uv
eval "$(uv generate-shell-completion zsh)"
