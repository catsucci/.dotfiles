# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=(git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

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

# Helpful aliases
alias vim=nvim
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
alias desktop="cd ~/Desktop/"
alias documents="cd ~/Documents/"
alias vault="cd ~/Documents/Vault"
alias pictures="cd ~/Pictures/"
alias downloads="cd ~/Downloads/"
alias videos="cd ~/Videos/"
alias music="cd ~/Music/"
alias dsa="cd ~/Desktop/kata-machine/src/" # ThePrimeagen dsa course exerices
alias odin="cd ~/Desktop/odin/" # My progress in The Odin Project directory
alias dot-files="cd ~/Desktop/.dotfiles/"
alias repos="cd ~/Repos/" # The Repos I clone for configuration or theming
alias cplus="cd ~/Desktop/cplus/"
alias ..="cd .." # go up one direcroty
alias ...="cd ../.." # go up two directories

# git aliases
alias g="git"
alias gs="git status"

# script aliases
alias tmux-sessionizer="~/.scripts/tmux.sessionizer.sh" # A tmux sessionizer script by ThePrimeagen
alias ide="~/.scripts/setup-tmux-panes.sh" # splits the panes as an ide
alias setup-repo="~/.scripts/setup-repo.sh" # setups a repo given as an argument usage: setup-repo {repo-name} {repo dir}
alias gamelauncher="~/.config/hypr/scripts/gamelauncher.sh 4" # Gamelauncher 4 is a variable [1..5] for styles requires steam opened

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
#pokemon-colorscripts --no-title -r 1,3,6

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
