# Set the directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

# Initialize Oh My Posh aka the prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/catppuccin_mocha.omp.json)"
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/1_shell.omp.json)"
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/neko.omp.json)"

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -s '^f' '~/bin/.local/scripts/tmux-sessionizer.sh\n' # A tmux sessionizer script by ThePrimeagen

# History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
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
alias vim=nvim # I like to do it like ThePrimeagen
alias l='eza -lh --icons=auto' # long list
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --tree --icons=auto' # list as tree
alias lta='eza -a --tree --icons=auto' # list as tree
alias llt='eza -lha --long --tree --icons=auto' # long list as tree
alias ..="cd .." # go up one directory
alias ...="cd ../.." # go up two directories
alias mkdir='mkdir -p'
alias c="clear"
alias x="exit"
alias vc='code' # gui code editor
alias myip="curl http://ipecho.net/plain; echo" # get IP address

# Script aliases
alias tsp="~/bin/.local/scripts/setup-tmux-panes.sh" # splits the panes in tmux
alias tmux-sessionizer='~/bin/scripts/tmux-sessionizer.sh'
alias cht="~/bin/.local/scripts/cht.sh --shell" # runs the cheat sheet in shell mode

# Git aliases
alias g="git"
alias gs="git status"
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdate='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'
alias gdatelong='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'

alias css-reset="cp -r ~/Documents/css-reset/ ."

# fzf settings
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export BAT_THEME="Catppuccin Mocha"

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Exports
export EDITOR='nvim'
export PATH="$HOME/.cargo/bin:$PATH"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)" # change the default cd to an alias for zoxide
eval $(thefuck --alias)

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

