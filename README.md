# Optixal's Neovim init.vim

Use it as a regular text editor, with [Dracula](https://github.com/dracula/vim) as the main colorscheme, key information from [vim-airline](https://github.com/vim-airline/vim-airline), and subtle git diff information with [vim-signify](https://github.com/mhinz/vim-signify):

![Regular Text Editor Usage](https://user-images.githubusercontent.com/19287477/123475234-af6d9980-d62d-11eb-8698-4b19c73409cf.png)

Or use it as a full-fledged IDE, with autocompletion from [CoC](https://github.com/neoclide/coc.nvim), a filesystem explorer from [NERDTree](https://github.com/preservim/nerdtree), and a side window from [Tagbar](https://github.com/preservim/tagbar) to browse tags and view the structure of the file you are working on:

![IDE Usage](https://user-images.githubusercontent.com/19287477/123474313-594c2680-d62c-11eb-9b6f-65eca8b3bf04.png)

Quickly find files or strings by fuzzy searching with [fzf.vim](https://github.com/junegunn/fzf.vim) in a beautiful pop-up window:

![FZF Usage](https://user-images.githubusercontent.com/19287477/123475668-4c303700-d62e-11eb-92cc-9e8dfbeffdfb.png)

Or perhaps.. ~~procrastinate~~ multitask with [vim-hackernews](https://github.com/dansomething/vim-hackernews) at the side while coding:

![Hacker News Usage](https://user-images.githubusercontent.com/19287477/123479447-88b26180-d633-11eb-988a-bd4cf772dccc.png)

Transparent/translucent terminal background support (uncomment lines in TransparentBackground function), example from WSL2 running Ubuntu on Windows:

![Transparent Usage](https://user-images.githubusercontent.com/19287477/123476545-6f0f1b00-d62f-11eb-8a3b-51589ac78cd7.png)

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

##### Install coc extensions

To get autocompletion capabilities for the various languages you work with, you need to install coc extensions for coc. If you code in JS, do frontend, and write Python, run the following within nvim:

```
:CocInstall -sync coc-tsserver coc-json coc-html coc-css coc-pyright
```

Find out more about coc extensions and what is available over [here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions).

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
