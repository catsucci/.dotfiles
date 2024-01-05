# Spotify & Spicetify

```bash
sudo pacman -S spotify
```

To style:

```bash
yay -S spicetify-cli
```

Tuto read this: <https://spicetify.app/docs/getting-started>

## Installing the themes

```bash
git clone git@github.com:spicetify/spicetify-themes.git
cd spicetify-themes
cp -r * ~/.config/spicetify/Themes
```

To create the config file run the following:

```bash
spicetify config-dir
```

This will create a config file named ``~/.config/spicetify/config-xpui.ini``

## Now add your paths

My Spotify path: `/home/catsucci/.local/share/spotify-launcher/install/usr/share/spotify/`

My prefs path: `/home/catsucci/.config/spotify/prefs`

## My favorite theme Catppuccin

```bash
spicetify config current_theme catppuccin
spicetify config color_scheme mocha
spicetify config inject_css 1 inject_theme_js 1 replace_colors 1 overwrite_assets 1
spicetify upply
```
