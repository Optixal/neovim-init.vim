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

`./install.sh`

Automatically installs my configuration, along with dependencies into your system. Tested on Ubuntu 20.04. I highly suggest reading and understanding each line of the installation script before running it, especially if you are using other Linux distros, or macOS. For macOS, manually run the commands, and use `homebrew` instead of `apt`.

#### Post Installation

##### Download and install a Nerd Font

Airline and devicons require a patched font, or Nerd Font in order to display properly. Run `./font_install.sh` to download and install Iosevka Term Nerd Font into your `~/.fonts` directory, or run the command manually:

```sh
curl -fLo ~/.fonts/Iosevka\ Term\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete.ttf
```

Once downloaded, open your terminal's preferences and change the font to "Iosevka Term Regular". If the font is not there, your OS' font directory may not be `~/.fonts`. Find out which directory your fonts are stored in, and place the downloaded font file in that directory instead.

##### Alias vim

It may be easier for you to type `vim` instead of `nvim` everytime you edit a file, so aliasing it could save you some trouble. Add an alias to your bashrc/zshrc/somerc or aliases file to alias nvim to vim:

```sh
echo "alias vim='nvim'" >> ~/.bashrc
```

##### Fix nvim + tmux issues

Running nvim within a tmux session may cause certain unwanted issues like escape key lag, or displaying wrong colors. Run `cat .tmux.conf >> ~/.tmux.conf` or manually add these to your `~/.tmux.conf` configuration file to address the issues:

```sh
set -sg escape-time 5 # fix vim esc delay
set -g default-terminal "screen-256color" # ensures vim uses right $TERM color, default is "screen"
set -ga terminal-overrides ",*256col*:Tc" # fixes vim reproducing slightly wrong colors in tmux
```

### Update

#### Updates from me

I occasionally update and push my new configurations here. If you want to receive the updates, you can pull the latest init.vim and replace the one you have.

```sh
git pull
cp init.vim ~/.config/nvim/
```

#### vim-plug commands for plugins

Run these to install new plugins, update or delete existing plugins, or upgrade vim-plug itself.

* Install plugins: `:PlugInstall` in nvim
* Update plugins: `:PlugUpdate` in nvim
* Delete unused plugins: `:PlugClean` in nvim
* Update vim-plug itself: `:PlugUpgrade` in nvim

### Mapped Commands in Normal Mode

Most custom commands expand off my map leader, keeping nvim as vanilla as possible.

* `,` - Map leader, nearly all my custom mappings starts with pressing the comma key
* `,q` or `\` - Toggle sidebar filetree viewer (NERDTree)
* `,w` or `|` - Toggle sidebar classes, functions, variables list (TagBar)
* `,ee` - Change colorscheme (with fzf fuzzy finder)
* `,ea` - Change Airline theme
* `,e1` - Color mode: Dracula (Dark)
* `,e2` - Color mode: Seoul256 (Between Dark & Light)
* `,e3` - Color mode: Forgotten (Light)
* `,e4` - Color mode: Zazen (Black & White)
* `,r` - Refresh/source ~/.config/nvim/init.vim
* `,t` - Trim all trailing whitespaces
* `,y` - Opens HackerNews in a new vertical split window (vim-hackernews)
* `,p` - Automatically generate Python docstrings while cursor is hovering above a Python function or class (vim-pydocstring)
* `,a` - Auto align variables (vim-easy-align), eg. do `,a=` while your cursor is on a bunch of variables to align their equal signs
* `,s` - Fuzzy find for a string in your current working directory (fzf)
* `,d` - Fuzzy find a file (fzf)
* `,f` - Fuzzy find for a string in the current file/buffer (fzf)
* `,g` - Toggle Goyo mode, super clean and minimalistic display mode (Goyo)
* `,h` - Toggle rainbow parentheses highlighting (rainbow-parentheses.vim)
* `,j` - Set filetype to "journal" which makes the syntax highlighting beautiful when working on regular text files and markdown
* `,k` - Toggle coloring of hex colors
* `,l` - Toggle Limelight mode, highlight the lines near cursor only (Limelight)
* `,x` - Auto format Python scripts (yapf)
* `,,` - Remove highlights
* `,c<Space>` - Toggle comment for current line (Nerd Commenter)
* `,$s` - New terminal in horizontal split
* `,$v` - New terminal in vertical split
* `<Alt-r/c>` - Toggle RGB color picker (vCoolor) (uses GTK+, requires yad or zenity)
* `<Tab>` - Next buffer
* `<Shift-Tab>` - Previous buffer
