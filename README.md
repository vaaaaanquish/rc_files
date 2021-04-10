# rc_files

### install iTerm2
using config from dropbox  
```
mkdir ~/work
mkdir ~/work/iterm
cp ./com.googlecode.iterm2.plist ~/work/iterm
```

### mdr
https://github.com/MichaelMure/mdr
set bin

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

### git-browse-remote
git-browse-remote
https://github.com/motemen/git-browse-remote
```
gem install git-browse-remote
```

### node
```
brew install nodebrew
mkdir -p ~/.nodebrew/src
nodebrew install-binary latest
nodebrew list
nodebrew use 0.0.1
echo 'export PATH=$PATH:/Users/xxxxx/.nodebrew/current/bin' >> ~/.bashrc
npm install -g yarn
```
check
```
node -v
npm -v
```

### python
```
brew install python
```

### nvim
neovim is god.
```
brew install luajit --HEAD
brew install neovim --HEAD
mkdir /tmp/backup/
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
mkdir -p ~/.config/coc/extensions
vim-monokai
mkdir ~/.vim
cd ~/.vim
mkdir colors
git clone https://github.com/tomasr/molokai
mv molokai/colors/molokai.vim ~/.vim/colors/
```

```
:call coc#util#install()
:CocInstall coc-python
:CocInstall coc-json
```

### pygements
for neovim
```
rbenv exec gem install redcarpet pygments.rb
```

### gtop
top command  
https://github.com/aksakalli/gtop
```
npm install gtop -g
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


### jupyter lab
from requirements.txt
````
jupyter serverextension enable --py jupyterlab --sys-prefix
jupyter notebook --generate-config
````
change:
`~/.jupyter/lab/user-settings/@jupyterlab/*`
extention:
```
jupyter labextension install @lckr/jupyterlab_variableinspector
jupyter labextension install @jupyterlab/toc
jupyter labextension install @ryantam626/jupyterlab_code_formatter
jupyter serverextension enable --py jupyterlab_code_formatter
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter nbextension enable --py --sys-prefix widgetsnbextension
jupyter labextension install @mflevine/jupyterlab_html
jupyter labextension install @jupyterlab/plotly-extension
jupyter labextension install jupyterlab_bokeh
jupyter labextension install ipyvolume
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install jupyterlab-drawio
```

```
mv .ipython/profile_default/startup/default_set.py ~/.ipython/profile_default/startup/
```

shortcut
```
{  
"shortcuts": [
        {
            "command": "jupyterlab_code_formatter:yapf",
            "keys": [
                "Ctrl Y",
            ],
            "selector": ".jp-Notebook.jp-mod-editMode"
        },
        {
            "command": "notebook:replace-selection",
            "args": {
                  "text": "df = op('./')"
              },
          "keys": [
            "Ctrl O"
          ],
          "selector": ".jp-Notebook.jp-mod-editMode"
        }
    ]
}
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

### app

install Karabiner-Elements  
https://pqrs.org/osx/karabiner/  
using vim mode
