# rc_files

```bash
mkdir -p ~/work/git
mkdir -p ~/.dirhist
mkdir -p ~/.openfilehist
```

## install iTerm2

using config from dropbo

```bash
mkdir ~/.iterm2
cp ./com.googlecode.iterm2.plist ~/.iterm2
```

## install brew

install xcode from app store

```bash
xcode-select --install
```

install brew [brew](https://brew.sh/index_ja.html)

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
```

## github

```bash
brew install git
```

get `github-ssh-id-rsa` from 1password

```bash
mkdir ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/github-ssh-id-rsa
```

`~/.ssh/config`

```bash
Host github github.com
  HostName github.com
  IdentityFile ~/.ssh/github-ssh-id-rsa
  User git
```

## install Font

[nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

```bash
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

iTerm2 > Preferences > Profiles > Text > Non-ASCII font > Hack Regular

## asdf

[guide](https://asdf-vm.com/guide/getting-started.html)

```bash
brew install gpg gawk
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
. $HOME/.asdf/asdf.sh
```

plugins

```bash
asdf plugin add nodejs
asdf plugin add ruby
asdf plugin add rust
asdf plugin add python
```

install lang

`asdf list all foo`

```bash
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest
corepack enable
asdf reshim nodejs

brew install libyaml
asdf plugin add ruby
asdf install ruby latest
asdf global ruby latest

asdf plugin add rust
asdf install rust latest
asdf global rust latest

brew install xz
asdf plugin add python
asdf install python latest
asdf global python latest
```

restart shell

## colorls

```bash
gem install colorls
```

`~/.zshrc`

```bash
source $(dirname $(gem which colorls))/tab_complete.sh
```

## git-browse-remote

[repo](https://github.com/motemen/git-browse-remote)

```bash
gem install git-browse-remote
```

### nvim

```bash
brew install luajit --HEAD
brew install neovim --HEAD
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"

mkdir -p ~/.config/coc/extensions
pip install jedi-language-server

mkdir -p ~/.config/nvim/colors
cd ~/.config/nvim/colors
git clone https://github.com/tomasr/molokai
mv molokai/colors/molokai.vim .

mkdir ~/.config/nvim/bundle
cd ~/.config/nvim/bundle
git clone https://github.com/kassio/neoterm.git

mkdir -p ~/.local/share/nvim/site/pack/nvim-treesitter/start
cd ~/.local/share/nvim/site/pack/nvim-treesitter/start
git clone https://github.com/nvim-treesitter/nvim-treesitter.git
```

```bash
cp .xonshrc ~/
cp coc-settings.json  ~/.config/nvim/
cp dein.toml ~/.config/nvim/
cp init.vim ~/.config/nvim/
```

```vim
:call coc#util#install()
:CocInstall coc-json
:CocInstall coc-yaml
:CocInstall coc-jedi
:TSIntall all
:UpdateRemotePlugins
```

## pygements

for neovim

```bash
gem install redcarpet pygments.rb
```

## fkill

[repo](https://github.com/sindresorhus/fkill-cli)

```bash
npm install --global fkill-cli
```

## vim markdown

[repo](https://github.com/suan/vim-instant-markdown)

```bash
npm -g install instant-markdown-d
```

## xonsh commands

```bash
pip install -r requirements.txt
brew install fx
brew install diff-so-fancy
brew install bat
brew install peco
brew install ag
cargo install fd-find
jupyter serverextension enable --py jupyterlab --sys-prefix
jupyter notebook --generate-config
```

## gcloud

[ref](https://cloud.google.com/sdk/docs/install)

```bash
mkdir -p ~/work/bin
cd ~/work/bin
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-426.0.0-darwin-arm.tar.gz
tar -xvf *.tar.gz
rm *.tar.gz
./google-cloud-sdk/install.sh
```

## check PATH

```bash
- .config/nvim/dein.toml
g:deoplete#sources#jedi#python_path

- .config/nvim/init.vim
set rtp+=~/.pyenv/versions/3.6.8/lib/python3.6/site-packages/powerline/bindings/vim/
dein path settings

- .xonshrc
$DIR_HIST_PATH

- .zshrc
export PATH="/Users/vanquish/homebrew/bin:$PATH"
```

## fix rc

```bash
cat .zshrc >> ~/.zshrc
```

## start xonsh shell

iterm settings > application > login shell

## Karabiner

install Karabiner-Elements
[using vim mode](https://chusotsu-program.com/karabiner-elements-vim/)

## claude code

```bash
npm install -g @anthropic-ai/claude-code
```

`~/.cache/dein/repos/github.com/folke/snacks.nvim/lua/snacks/util/init.lua`
の84行目辺りを修正 [](https://github.com/folke/snacks.nvim/issues/209)

```lua
    if type(v) == "string" then
      v = string.gsub(v, "…", ".")
    end
    vim.api.nvim_set_option_value(k, v, { scope = "local", win = win })
```
