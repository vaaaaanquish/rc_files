# rc_files

### install iTerm2
using config from dropbox  
```
/Users/vanquish/Dropbox/iterm
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

### install Font
for colorls.
```
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
```
iTerm2 > Preferences > Profiles > Text > Non-ASCII font > Hack Regular


### ruby
```
brew install rbenv ruby-build
source ~/.zshrc
rbenv install -l
rbenv install 0.0.1
rbenv global 0.0.1
```

### colorls
colorls
```
gem install colorls
source $(dirname $(gem which colorls))/tab_complete.sh
```

### node
```
brew install nodebrew
mkdir -p ~/.nodebrew/src
nodebrew install-binary latest
nodebrew list
nodebrew use 0.0.1
echo 'export PATH=$PATH:/Users/xxxxx/.nodebrew/current/bin' >> ~/.bashrc
```
check
```
node -v
npm -v
```

### python
```
brew install pyenv
cat << 'EOS' >> ~/.bash_profile
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
EOS
source ~/.bash_profile
source ~/.zshrc
pyenv install -l
pyenv install 3.6.8
pyenv global 3.6.8
```

### nvim
neovim is god.
```
brew install neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim-monokai
mkdir ~/.vim
cd ~/.vim
mkdir colors
git clone https://github.com/tomasr/molokai
mv molokai/colors/molokai.vim ~/.vim/colors/
```

### pygements
for neovim
```
rbenv exec gem install redcarpet pygments.rb
```

### vim markdown
markdown preview
```
https://github.com/suan/vim-instant-markdown
npm -g install instant-markdown-d
```

### xonsh
https://www.soimort.org/translate-shell/
```
wget git.io/trans -O /usr/local/bin/trans
chmod +x /usr/local/bin/trans
```
iterm imgcat
```
cd /usr/local/bin
wget https://www.iterm2.com/utilities/imgcat
chmod +x imgcat
```
commands
```
brew install fx
brew install diff-so-fancy
brew install bat
brew install peco
brew install ag
```
install
```
pip install -r requirements.txt
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
