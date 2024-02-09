# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=(git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Zsh syntax highlighting theme
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local pkg="$1"
    if pacman -Si "$pkg" &>/dev/null ; then
        sudo pacman -S "$pkg"
    else 
        "$aurhelper" -S "$pkg"
    fi
}

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
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code' # gui code editor
alias c="clear"
alias x="exit"
alias myip="curl http://ipecho.net/plain; echo" # get IP address
alias zshconf="nvim ~/.zshrc" # to open and edit the config
alias zshsrc="source ~/.zshrc" # to source the config

# ease acces to directories
alias ..="cd .." # go up one direcroty
alias ...="cd ../.." # go up two directories

# git aliases
alias g="git"
alias gs="git status"

# script aliases
alias ide="~/.scripts/setup-tmux-panes.sh" # splits the panes as an ide
alias setup-repo="~/.scripts/setup-repo.sh" # setups a repo given as an argument usage: setup-repo {repo-name} {repo dir}

# fzf stuff
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
