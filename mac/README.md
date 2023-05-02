# rc_files

```
mkdir -p ~/work/git
mkdir -p ~/.dirhist
mkdir -p ~/.openfilehist
```

### install iTerm2
using config from dropbox  
```
mkdir ~/.iterm2
cp ./com.googlecode.iterm2.plist ~/.iterm2
```

### install brew
install xcode from app store.  
```
xcode-select --install
```

install brew (https://brew.sh/index_ja.html)
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
```

### github

```
brew install git
```

get `github-ssh-id-rsa` from 1password

```
mkdir ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/github-ssh-id-rsa
```

`~/.ssh/config`

```
Host github github.com
  HostName github.com
  IdentityFile ~/.ssh/github-ssh-id-rsa
  User git
```

### install Font

https://github.com/ryanoasis/nerd-fonts

```
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

iTerm2 > Preferences > Profiles > Text > Non-ASCII font > Hack Regular

### asdf

https://asdf-vm.com/guide/getting-started.html

```
brew install gpg gawk
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
. $HOME/.asdf/asdf.sh
```

plugins

```
asdf plugin add nodejs
asdf plugin add ruby
asdf plugin add rust
asdf plugin add python
```

install lang

`asdf list all foo`

```
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

### colorls

```
gem install colorls
```

`~/.zshrc`

```
source $(dirname $(gem which colorls))/tab_complete.sh
```

### git-browse-remote

https://github.com/motemen/git-browse-remote

```
gem install git-browse-remote
```

### nvim

```
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

```
cp .xonshrc ~/
cp coc-settings.json  ~/.config/nvim/
cp dein.toml ~/.config/nvim/
cp init.vim ~/.config/nvim/
```

https://github.com/neoclide/coc.nvim/wiki/Language-servers#python
```
:call coc#util#install()
:CocInstall coc-json
:CocInstall coc-yaml
:CocInstall coc-jedi
:TSIntall all
:UpdateRemotePlugins
```


### pygements
for neovim
```
gem install redcarpet pygments.rb
```

### fkill
kill command  
https://github.com/sindresorhus/fkill-cli
```
npm install --global fkill-cli
```

### vim markdown
markdown preview  
https://github.com/suan/vim-instant-markdown
```
npm -g install instant-markdown-d
```

### xonsh commands

commands
```
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

### gcloud

ref: https://cloud.google.com/sdk/docs/install

```
mkdir -p ~/work/bin
cd ~/work/bin
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-426.0.0-darwin-arm.tar.gz
tar -xvf *.tar.gz
rm *.tar.gz
./google-cloud-sdk/install.sh
```

## check PATH
```
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

### fix rc

```
cat .zshrc >> ~/.zshrc
```

### start xonsh

iterm settings > application > login shell

### app

install Karabiner-Elements  
https://pqrs.org/osx/karabiner/  
using vim mode
