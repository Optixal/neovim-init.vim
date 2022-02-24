#!/bin/bash

FONT_DIR=~/.local/share/fonts
# (Optional but recommended) Install a nerd font for icons and a beautiful airline bar (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts) (I'm using Iosevka Term Nerd Font)
echo "[*] Downloading patch font into ~/.local/share/fonts ..."
mkdir -p ${FONT_DIR}
cd ${FONT_DIR}
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete.ttf
echo "[+] Downloaded. Select Iosevka Term Regular as your terminal's custom font."
# gnome-terminal fix
echo "[!] There is a bug in gnome-terminal (still present in Ubuntu 20.04 ) that will not make the font being used by it or displayed in the selection list."
echo "To fix this: apt-get install gnome-tweaks"
echo "Select this font, set the size."
echo "In gnome-terminal under your profile: UNselect custom-font (or the font will be massivly overspaced between chars)"
echo "Alternatively : What also works (sometimes):"
echo "dconf dump /org/gnome/terminal/legacy/profiles:/"
echo "grab the uuid..."
echo "Set the font: (mind the double quote!)"
echo "example: dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/font \"'Iosevka Term Nerd Font Complete 11'\""

