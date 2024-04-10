# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# List of plugins used
plugins=(git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Zsh syntax highlighting theme
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# set vi motions
set -o vi

# Keybindings
bindkey -s '^f' '~/.scripts/tmux.sessionizer.sh\n' # A tmux sessionizer script by ThePrimeagen

# Helpful aliases
alias vim=nvim # I like to do it like ThePrimeagen
alias fvim='nvim $(fzf)' # To vim into the fuzzy finded file
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --tree --icons=auto' # list as tree
alias llt='eza --long --tree --icons=auto' # long list as tree
alias vc='code' # gui code editor
alias c="clear"
alias x="exit"
alias myip="curl http://ipecho.net/plain; echo" # get IP address
alias zshconf="nvim ~/.zshrc" # to open and edit the config
alias zshsrc="source ~/.zshrc" # to source the config

# ease acces to directories
alias ..="cd .." # go up one direcroty
alias ...="cd ../.." # go up two directories

# script aliases
alias tsp="~/.scripts/setup-tmux-panes.sh" # splits the panes in tmux

# git aliases
alias g="git"
alias gs="git status"
# Logging helpers
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias gdate='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'
alias gdatelong='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'

# fzf stuff
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
#pokemon-colorscripts --no-title -r 1,3,6

# fzf catppuccin theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Setting up lazygit theme
# This will instruct lazygit to open both config files, merge them, and then boot.
# You can add more config files, delimited by a comma, to this list
# uncomment if lazygit doesn't follow your terminal theme (mine is catppucin)
# alias lazygit='lazygit --use-config-file="/home/catsucci/.config/lazygit/config.yml,/home/catsucci/.config/lazygit/mauve.yml"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# change the default cd to an alias for zoxide
eval "$(zoxide init --cmd cd zsh)"

# required to initialize starship
eval "$(starship init zsh)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
