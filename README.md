# Optixal's Neovim init.vim

Normal usage.

![Normal Usage Example](https://user-images.githubusercontent.com/19287477/62753305-b329be80-ba9d-11e9-84a8-8e778a47bd10.png)

Minimal, focussed sessions with Goyo.

![Goyo Minimal Example](https://user-images.githubusercontent.com/19287477/62753311-b6bd4580-ba9d-11e9-936f-6dbadf90af46.png)

Multi-windowed editing with NerdTree and TagBar sidebars.

![Multi-Window Example](https://user-images.githubusercontent.com/19287477/62753315-b8870900-ba9d-11e9-9276-705c3ab76eba.png)

## Installing and Updating

### Install

#### Automated Installation

Run `./install.sh`

#### Manual Installation

```sh
#!/bin/bash -e

# Make config directory for Neovim's init.vim
mkdir -p ~/.config/nvim

# Install nvim (and its dependencies: pip3, git), Python 3 and ctags (for tagbar)
sudo apt update
sudo apt install neovim python3 python3-pip git curl exuberant-ctags -y

# Install virtualenv to containerize dependencies
python3 -m pip install virtualenv
python3 -m virtualenv -p python3 ~/.config/nvim/env

# Install pip modules for Neovim within the virtual environment created
source ~/.config/nvim/env/bin/activate
pip install neovim==0.2.6 jedi psutil setproctitle yapf
deactivate

# Install vim-plug plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# (Optional but recommended) Install a nerd font for icons and a beautiful airline bar (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts) (I'll be using Iosevka for Powerline)
curl -fLo ~/.fonts/Iosevka\ Term\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete.ttf

# (Optional) Alias vim -> nvim
echo "alias vim='nvim'" >> ~/.bashrc

# Enter Neovim and install plugins using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
sed '/call plug#end/q' init.vim > ~/.config/nvim/init.vim
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'
rm ~/.config/nvim/init.vim

# Copy init.vim in current working directory to nvim's config location ...
cp init.vim ~/.config/nvim/
```

### Update

Update plugins (super simple)

```
nvim
:PlugUpdate
```

(Optional) Clean plugins - Deletes unused plugins

```
nvim
:PlugClean
```

(Optional) Check, download and install the latest vim-plug

```
nvim
:PlugUpgrade
```

(Optional) Pull my updates if you want my new modifications

```sh
git pull
cp init.vim ~/.config/nvim/
```

## Note

### For Non-GUI Users

* Colorschemes may not be rendered
* Changing fonts may be harder (https://unix.stackexchange.com/a/49823), if you do not intend to do customize your font, you should uncomment the devicons plugin within "init.vim" (`" Plug 'ryanoasis/vim-devicons'`)

### Mapped Commands in Normal Mode

Most custom commands expand off my map leader, keeping nvim as vanilla as possible.

* `,` - Map leader, nearly all my custom mappings starts with pressing the comma key
* `,q` - Sidebar filetree viewer (NERDTree)
* `,w` - Sidebar classes, functions, variables list (TagBar)
* `\`  - Toggle both NERDTree and TagBar
* `,ee` - Change colorscheme (with fzf fuzzy finder)
* `,ea` - Change Airline theme
* `,e1` - Color mode: Dracula (Dark)
* `,e2` - Color mode: Seoul256 (Between Dark & Light)
* `,e3` - Color mode: Forgotten (Light)
* `,e4` - Color mode: Zazen (Black & White)
* `,r` - Refresh/source ~/.config/nvim/init.vim
* `,t` - Trim all trailing whitespaces
* `,a` - Auto align variables (vim-easy-align), eg. do `,a=` while your cursor is on a bunch of variables to align their equal signs
* `,s` - New terminal in horizontal split
* `,vs` - New terminal in vertical split
* `,d` - Automatically generate Python docstrings while cursor is hovering above a function or class
* `,f` - Fuzzy find a file (fzf)
* `,g` - Toggle Goyo mode (Goyo), super clean and minimalistic viewing mode
* `,h` - Toggle rainbow parentheses highlighting
* `,j` - Set filetype to "journal" which makes the syntax highlighting beautiful when working on regular text files and markdown
* `,k` - Toggle coloring of hex colors
* `,l` - Toggle Limelight mode (Limelight), highlight the lines near cursor only
* `,c<Space>` - Toggle comment for current line (Nerd Commenter)
* `<Alt-r>` - Toggle RGB color picker
* `<Tab>` - Next buffer
* `<Shift-Tab>` - Previous buffer

More commmands at https://github.com/Optixal/.vim/blob/master/reference/commands_vim.txt

