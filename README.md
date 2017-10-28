# Optixal's Neovim init.vim

Normal usage.

![Normal Usage Example](screenshots/screenshot1.png)

Minimal, focussed sessions with Goyo.

![Goyo Minimal Example](screenshots/screenshot2.png)

Multi-windowed editing with NerdTree and TagBar sidebars.

![Multi-Window Example](screenshots/screenshot3.png)

## Installing and Updating

### Install

```sh
# Install nvim, pip3 and git
sudo apt install neovim python3-pip git

# Install pip modules for Neovim
pip3 install --user neovim jedi psutil setproctitle

# Install vim-plug plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Make config directory for Neovim's init.vim
mkdir -p ~/.config/nvim

# Soft link the init.vim in current working directory to nvim's config location. Or simply `cp init.vim ~/.config/nvim/`
ln -sf $(readlink -f init.vim) ~/.config/nvim/.

# (Optional but recommended) Install a nerd font for icons and a beautiful airline bar (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts) (I'm using Roboto Mono Nerd Font Complete) (remember to change terminal font to Roboto Mono, or whichever patched font you've picked!)
curl -fLo ~/.local/share/fonts/Roboto\ Mono\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf

# (Optional) Alias vim -> nvim
echo "alias vim='nvim'" >> ~/.bashrc

# Enter Neovim and install plugins
nvim
:PlugInstall
:qa! # Quit All Force (no save). Useful when dealing with multiple split windows.
```

### Update

```sh
# (Optional) Pull my updates if you want my new modifications
git pull

# Update the plugins (super simple)
nvim
:PlugUpdate

# (Optional) Clean plugins - Deletes unused plugins
:PlugClean

# (Optional) Check, download and install the latest vim-plug updates
:PlugUpgrade
```

## Note

### For Non-GUI Users

* Colorschemes may not be rendered
* Changing fonts may be harder (https://unix.stackexchange.com/a/49823), if you can't be bothered, you should uncomment the devicons plugin within "init.vim" (`" Plug 'ryanoasis/vim-devicons'`)

### Mapped Commands in Normal Mode

Most custom commands expand off my map leader, keeping nvim as vanilla as possible.

* `,` Map Leader
* `,q` Sidebar filetree viewer (NERDTree)
* `,w` Sidebar classes, functions, variables list (TagBar)
* `\`  Toggle both NERDTree and TagBar
* `,s` New terminal in horizontal split
* `,vs` New terminal in vertical split
* `,a` Auto align variables (vim-easy-align)
* `,f` Fuzzy find a file (fzf)
* `,g` Goyo mode (Goyo)
* `,l` Limelight mode (Limelight)
* `,h` Hackernews vertical windows (requires internet) (vim-hackernews)
* `,r` Refresh/source ~/.config/nvim/init.vim
* `,c<Space>` Toggle comment for current line (Nerd Commenter)
* `<Tab>` Next buffer
* `<Shift-Tab>` Previous buffer

More commmands at https://github.com/Optixal/.vim/blob/master/reference/commands_vim.txt

