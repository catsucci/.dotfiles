
# Read this <https://github.com/prasanthrangan/hyprdots/wiki/FAQ>

## Monitor settings

```bash
nvim ~/.config/hypr/monitors.conf
```

The general config of a monitor looks like this

monitor=name,resolution,position,scale

A common example:

monitor=eDP-1,1920x1080@60,0x0,1

will tell Hyprland to make the monitor on DP-1 a 1920x1080 display, at 144Hz, 0x0 off from the top left corner, with a scale of 1 (unscaled).

To list all available monitors (active and inactive):

hyprctl monitors all

See <https://wiki.hyprland.org/Configuring/Monitors/>

# Kitty aka the terminal

Edit the kitty.conf as you wish

```bash
nvim ~/.config/kitty/kitty.conf
```

to use mine:

```bash
cd where/my/dotfiles/are
cp kitty/kitty.conf ~/.config/kitty
```

# Hyprland settings

Costume settings in ~/.config/hypr/userprefs.conf

```bash
nvim ~/.config/hypr/userprefs.conf
```

then add your costume config.
mine is:

```conf
input {
    kb_layout = us
    follow_mouse = 1

    touchpad {
        natural_scroll = yes
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    force_no_accel = 1
}

device:epic mouse v1 {
    sensitivity = -0.5
}
```

# Clone my dot files

```bash
git clone https://github.com/catsucci/.dotfiles.git
```

Copy whatever you need
like for zsh:

```bash
cd .dotfiles
cp zsh/.zshrc ~/
cp zsh/.p10k.zsh ~/
```

copy my scripts and fix the aliases

## emoji and symbols

<https://wiki.archlinux.org/title/Fonts#Emoji_and_symbols>
