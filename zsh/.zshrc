# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# List of plugins used
plugins=(
	git
	sudo
	copyfile
	web-search
	zsh-256color
	zsh-autosuggestions
	zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# Zsh syntax highlighting theme
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# set vi motions
set -o vi

# Keybindings
bindkey -s '^f' '~/.scripts/tmux.sessionizer.sh\n' # A tmux sessionizer script by ThePrimeagen

# Helpful aliases
alias vim=nvim # I like to do it like ThePrimeagen
alias  l='eza -lh  --icons=auto' # long list
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --tree --icons=auto' # list as tree
alias lta='eza -a --tree --icons=auto' # list as tree
alias llt='eza -lha --long --tree --icons=auto' # long list as tree
alias vc='code' # gui code editor
alias c="clear"
alias x="exit"
alias myip="curl http://ipecho.net/plain; echo" # get IP address
alias zshconf="nvim ~/.zshrc" # to open and edit the config
alias zshsrc="source ~/.zshrc" # to source the config
# Viewing man pages with bat using the `help` command
alias bathelp='bat --plain --language=help'
help() {
  "$@" --help 2>&1 | bathelp
}
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
#Toggle starship customization for compact panes in tmux
alias stroff='mv ~/.config/starship.toml ~/.config/starship.toml.bak'
alias stron='mv ~/.config/starship.toml.bak ~/.config/starship.toml'
# easy acces to directories
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

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

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

# thef*ck
eval $(thefuck --alias)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
