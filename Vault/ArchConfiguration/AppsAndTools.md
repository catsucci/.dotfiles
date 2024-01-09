# configure  pacman's mirror image

```bash
sudo pacman -S reflector
```

Backup the mirror image list:

```bash
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
```

Update the mirror list depending on the speed:

```bash
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

## Neovim

Install Neovim to edit the configs
Install NvChad as default (we make a costume one later)

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

## Some useful apps

Obsidian vlc
flatpak install flathub md.obsidian.Obsidian

```bash
sudo pacman -S p7zip zip unzip unrar htop wget locate fzf man-db
yay -S timeshift gnome-shell-pomodoro speedtest-cli
```

## install java

```bash
sudo pacman -S jdk-openjdk
```

## install apps

```bash
sudo pacman -S libreoffice-fresh vlc gimp krita inkscape obs-studio
```

## Discord & webcord (for streaming)

```bash
yay -S discord_arch_electron Webcord 
```

## Install games

```bash
sudo pacman -S steam
```

```bash
flatpak install flathub com.github.Matoking.protontricks
```

## install tmux

```bash
sudo pacman -S tmux
```

configure tmux using Dreams of code config:

```bash
mkdir ~/.config/tmux
cd ~/.config/tmux
wget https://raw.githubusercontent.com/dreamsofcode-io/tmux/main/tmux.conf
```

## Zathura

A light wieght pdf reader

Will not work with pdf by default, you ,might need to install this:

```bash
sudo pacman -S zathura zathura-pdf-mupdf
```

Read more on <https://wiki.archlinux.org/title/Zathura>

Or install alternative:

## llpp

```bash
yay -S llpp
```
