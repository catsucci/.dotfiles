# This my newest backup guide

To when I f*ck something up.

## Introduction

We keeping it simple, `archinstall` will do just fine.
Since I'm currently following typecraft's series on linux,
I will simply just do as he do, with my own things added on top,
so Go [watch it](https://www.youtube.com/playlist?list=PLsz00TDipIffGKMW4hmzmwXTvARXyJMn8) if you want.

## Arch setup

### Connect to the internet

```bash
iwctl
[]device list # If device is off: device $DEVICE set propetry Powered on
station $ADAPTER get-networks
station $ADAPTER connect $WIFI
# It will asks you for the password next
# C^d to exit
```

To check if you're connected, run the following command:

```bash
ping archlinux.org
```

If you're getting some repetitive output with 64s, you're good to go.

```bash
# C^c to stop running the command
```

And now, we do the fun stuff:

```bash
pacman -Syy # to update just in case
pacman -S archlinux-keyring
pacman -Sy archinstall
archinstall # simply do what you think is good for you, for me I'll pick gnome for the de
reboot
```

Now, we would have a running Arch linux with gnome desktop, what's left is just my personal customization.

> note: in case you want to run a custom script for something like Hyprland, you might not want to choose a de (desktop environment), so you might get stuck connecting to the internet, for that follow the next steps:
```bash
nmcli d
nmcli r wifi on
nmcli d wifi list
nmcli d wifi connect $SSID password $PASSWORD
# if you don't have git don't forget to get that as well
```
> note: In case some basic folder are missing (such as Desktop, Documents, ...) do the following:
```bash
sudo pacman -S xdg-user-dirs
xdg-user-dirs-update
```

### Customizing pacman

If you want to allow multiple packages to be downloaded at the
same time and some other cool stuff, just edit the following file to your liking:

```bash
sudo vi /etc/pacman.conf # If it seems confusing, read the docs
```

### Installing yay

To install yay:
```bash
# in you're home dir
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### My stuff

So, now we have a running Arch linux, with either Gnome, or your 
sexy riced environment, All that left is my apps and config files.

First, I need git to clone my dotfiles:

```bash
sudo pacman -S git
git clone https://github.com/catsucci/.dotfiles.git
cd .dotfiles # don't dorget the . before the dir name
```

Here you can find some of my configs that simplify doing some things.

So, let me start doing my stuff:

```bash
# Supposing we are in the .dotfiles
cp .gitconfig ~/
```

> note: Most of my stuff don't get copied out of the bat, since most of them have some packages as dependencies, so I just read docs or debug issues.

### Some useful apps & tools

```bash
sudo pacman -S blueman zsh tree-sitter-cli xclip firefox p7zip zip unzip unrar htop wget locate fzf man-db ripgrep tmux neovim zoxide ttf-jetbrains-mono-nerd jdk-openjdk libreoffice-fresh vlc gimp inkscape obs-studio zathura zathura-pdf-mupdf flatpak github-cli lazygit python-pip spotify-launcher sqlite-doc sqlitebrowser alacritty bat bluez-utils cloc curl eza fd htop kdenlive noto-fonts-cjk noto-fonts-emoji steam texlive thefuck tldr wine
yay -S litecli vesktop-bin visual-studio-code-bin
```
Some other apps:
postman, sublime merge, audacity, ...

### configuration

#### GIT & Github

Configure git using [this course](https://www.theodinproject.com/lessons/foundations-setting-up-git), GitHub cli using `gh auth login`, 

#### Node.js

Install node using [This one](https://www.theodinproject.com/lessons/foundations-installing-node-js)
and yran using `npm install --global yarn`.

#### Neovim

After installing neovim, clone my nvim config into ~/.config

```bash
cd ~/.config
git clone git@github.com:catsucci/nvim.git
```
run `checkhealth` inside nvim and install any missing dependency
and do your debugs.

#### Alacritty

To use my config:

```bash
cp -r ~/PATH/TO/MYDOTFILES/alacritty ~/.config
```
#### Tmux

For Tmux, you'll need to install the Tmux Plugin Manager using

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then copy my config files

```bash
cp -r ~/PATH/TO/MYDOTFILES/tmux ~/.config
```

Open tmux and do `C-space + I` to install the plugins.

#### Zsh

Set zsh to be your default shell:

```bash
chsh $USERNAME
# make you sure you know where is your zsh path is
/usr/bin/zsh
```
Copy my .zshrc into your home dir:

```bash
cp ~/PATH/TO/MYDOTFILES/zsh/.zshrc ~/
```

If there is any issues just watch [This Dreams of Autonomy vid](https://www.youtube.com/watch?v=ud7YxC33Z3w&t=262s).

#### Zoxide

If There is any issues just watch [This Dreams of Autonomy vid](https://www.youtube.com/watch?v=aghxkpyRVDY&t=397s).

#### scripts

Copy my .scripts dit into your home:

```bash
cp -r ~/PATH/TO/MYDOTFILES/.scripts ~/
```

#### Zathura

Copy my Zathura config dir intoi ~/.config:

```bash
cp -r ~/PATH/TO/MYDOTFILES/zathura ~/.config
```

#### FONTS

Some of the popular fonts:

```bash
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts
```

Japanese fonts:

```bash
sudo pacman -S noto-fonts-cjk adobe-source-code-pro-fonts adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts 
```
> [!NOTE]
> In case of firefox having a bad experience with arabic fonts:

```bash
sudo pacman -S firefox-i18n-ar
```
