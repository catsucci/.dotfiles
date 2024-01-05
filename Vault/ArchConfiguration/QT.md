# QT

<https://wiki.archlinux.org/title/qt>

install QT6 packages:

```bash
sudo pacman -S qt6-base qt6-doc qtcreator qt6-examples qt6-tools qt6-languageserver
```

## Themes -Catppuccin-

Run the following commands (It is recomanded to follow instruction on Catppuccin websites)

```bash
cd ~/.config/QtProject/qtcreator/
mkdir styles themes
cd styles
wget https://raw.githubusercontent.com/catppuccin/qtcreator/main/styles/catppuccin-mocha.xml
cd ../themes
wget https://raw.githubusercontent.com/catppuccin/qtcreator/main/themes/catppuccin-mocha.creatortheme
```

Set the theme & color scheme in Qt Creator:

* Go to Edit > Preferences.
* Select the "Environment" tab. Change the Theme dropdown to your flavour of choice.
* Press OK. Qt Creator will prompt you to restart, press Restart Now.
* Usually Qt Creator will automatically select the matching text editor theme for you. If not continue to the next steps.
* Go to Edit > Preferences again.
* Select the "Text Editor" tab. Change the Color Scheme dropdown to your flavour of choice.

And done.
