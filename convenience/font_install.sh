#!/bin/bash

# (Optional but recommended) Install a nerd font for icons and a beautiful airline bar (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts) (I'm using Iosevka Term Nerd Font)
echo "[*] Downloading patch font into ~/.local/share/fonts ..."
curl -fLo ~/.fonts/Iosevka\ Term\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete%20Mono.ttf
fc-cache -rv
echo "[+] Downloaded and refreshed cache. Select Iosevka Term Regular as your terminal's custom font. Restart your terminal if the font is not appearing in the list of selectable fonts."
