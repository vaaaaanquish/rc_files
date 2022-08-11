# Ubuntu 20.04 settings

# I/O driver
keyboard, touchpad, network, display

ref: https://askubuntu.com/posts/1324339/revisions
```
sudo add-apt-repository -y ppa:canonical-hwe-team/backport-iwlwifi
sudo apt update
sudo apt upgrade
sudo apt install -y backport-iwlwifi-dkms gcc make git build-essential

git clone git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
cd linux-firmware
sudo cp iwlwifi-* /lib/firmware/
cd ..

git clone https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/backport-iwlwifi.git
cd backport-iwlwifi
make defconfig-iwlwifi-public
make -j4
sudo make install

sudo update-initramfs -u
sudo reboot
```
```
sudo service NetworkManager start
```
```
# display
sudo apt purge -y 'nvidia*
sudo add-apt-repository ppa:graphics-drivers
sudo apt update
```
```
sudo vi /etc/modprobe.d/blacklist.conf
### write
### "blacklist nouveau"
### "options nouveau modeset=0" 
sudo update-initramfs -u
sudo reboot
```
```
ubuntu-drivers devices
### check recommended driver
sudo apt install nvidia-driver-470
sudo reboot
```

# git

```
git config --global user.name "vaaaaanquish"
git config --global user.email "6syun9@gmail.com"

cd ~/.ssh
vi id_rsa
# from 1password
ssh -T git@github.com
```


# Ubuntu

```
settings
appearance
privacy > screen lock
power
mouse, touch pad
keyboad shortcut all disable (Switch application Alt+Tab)
```

# disable Dock
```
gnome-extensions disable ubuntu-dock@ubuntu.com
```

# Chrome
```
# https://www.google.co.jp/chrome/ download deb
sudo apt install ./chrome.deb
```

# 1password
```
# https://1password.com/jp/downloads/linux/ download deb
sudo apt install ./1password.deb
# sign in and add chrome extention
```

# CUDA
```
# check: https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_network
sudo apt-get -y install cuda
```

# cudnn
```
# https://developer.nvidia.com/cudnn
# login and download deb for ubuntu2004
sudo apt install ./libcudnn.deb
```
```
vi .bashrc
# export PATH="/usr/local/cuda/bin:$PATH"
# export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
```

# slack
```
# https://slack.com/intl/ja-jp/downloads/instructions/ubuntu
sudo apt install ./slack.deb
```

# keybord capslock -> ctrl

```
vi /etc/default/keyboard
# XKBOPTIONS="ctrl:nocaps"
sudo systemctl restart console-setup
```

# keybindings autokey 

```
sudo apt install autokey-gtk
# autokey settings copy folder 
cp ubuntu/autokey/data/keybindings/* ~/.config/autokey/keybindings/
cp ubuntu/autokey/autokey.json ~/.config/autokey/
# login auto
# setting all hot key!!
```

# mozc
```
sudo apt install ibus-mozc
ibus restart
reboot

# GUI settings Region&Language input -> mozc only
# mozc setteing 
# ctrl+i direct input -> set input hiragana
# ctrl+i other -> deactive IME
# add precomposition enter -> commit
```

# Guake

```
sudo apt install guake
# guake settings 
# dconf dump /apps/guake/ > guake.dconf
dconf load /apps/guake/ < guake.dconf
```
# Albert

```
curl "https://build.opensuse.org/projects/home:manuelschneid3r/public_key" | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt update
sudo apt install copyq wmctrl
sudo apt install albert


# setting albelt
- meta + space
- Theme: Arc Dark Gray
- Amount of results: 10
- sudo apt install -y imagemagick
- startup
- and extensions
    - Calculator
    - Chromium
    - Python
         - CopyQ
            - # extention -> python ->  copyq and Window switcher
            - # open copyq __init__.py > active key "c"
    - Unicode emoji?
    - websearch google
```


# clipoard
```
# start copyq settings
- Autostart
- Always on Top
- history:1000
- global: show hide menu -> alt+v
- theme: dark
```



# discord

```
# https://discord.com/ download deb
sudo apt install discord.deb
```


# Python, ruby, node, tools 

```
sudo apt install -y libncurses5-dev
sudo apt install -y python-is-python3 python3-pip libpython3.8-dev
sudo apt install -y ruby ruby-dev
```
```
vi ~/.bashrc
# export PATH="/home/vanquish/.local/bin:$PATH"
```
```
sudo gem install git-browse-remote
sudo gem install redcarpet pygments.rb
```
```
sudo add-apt-repository ppa:aos1/diff-so-fancy
sudo apt update
sudo apt install diff-so-fancy
sudo apt install bat
sudo apt install silversearcher-ag
```
```
pip install -r requirements.txt  # from github

# restart terminal
jupyter serverextension enable --py jupyterlab --user
jupyter notebook --generate-config
```
```
sudo apt install libssl1.1=1.1.1f-1ubuntu2
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# if update errorr > rm /etc/apt/sources.list.d/cudnn*
sudo apt -y update
sudo apt -y install nodejs
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
npm install -g yarn

vi ~/.bashrc
# export PATH="$HOME/.npm-global/bin:$PATH"
```
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# restart terminal
rustup toolchain install nightly
rustup run nightly cargo install tree-sitter-cli

vi ~/.bashrc
export PATH="$HOME/.cargo/bin:$PATH"
```

# nvim

```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt install neovim/focal
```

```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
mkdir -p ~/.config/coc/extensions

mkdir ~/.vim
cd ~/.vim
mkdir colors
git clone https://github.com/tomasr/molokai
mkdir -p ~/.config/nvim/colors
mv molokai/colors/molokai.vim ~/.config/nvim/colors/

mkdir ~/.config/nvim/bundle
cd ~/.config/nvim/bundle
git clone https://github.com/kassio/neoterm.git

mkdir -p ~/.local/share/nvim/site/pack/nvim-treesitter/start
cd ~/.local/share/nvim/site/pack/nvim-treesitter/start
git clone https://github.com/nvim-treesitter/nvim-treesitter.git
```
```
# copy rc_files ubuntu/coc-settings.json, dein.toml, init.vim
cp ubuntu/.xonshrc ~/
cp ubuntu/coc-settings.json ~/.config/nvim/
cp ubuntu/dein.toml ~/.config/nvim/
cp ubuntu/init.vim ~/.config/nvim/
```
```
sudo apt install xsel
```
```
:call coc#util#install()
:CocInstall coc-json
:TSIntall all
:UpdateRemotePlugins
```
```
cd ~/.cache/dein/repos/github.com/neoclide/coc.nvim
yarn install
yarn build
```
agree: treesitter warning

# font

```
git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh Hack
cd ..
rm -rf nerd-fonts
```

# peco

```
sudo apt install peco
```

# docker

```
sudo apt install -y libssl-dev

sudo rm "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker

sudo usermod -aG docker vanquish
```

```
sudo nvim /lib/systemd/system/docker.service

# [Service]
# TimeoutStopSec=150
```

ref: https://docs.docker.com/compose/cli-command/#install-on-linux
```
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
docker compose version
```

# zsh

```
sudo apt install -y zsh
```

# rc
```
vim ~/.zshrc
```
```
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export ZSH_FLAG="true"  # zsh only
. "$HOME/.cargo/env"

xonsh
```
```
vim ~/.bashrc
```
```
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

xonsh
```

# dualdisplay and trackpad

ref: https://ohmyenter.com/trackpad-gestures-with-libinput-on-linux/
```
sudo gpasswd -a $USER input
sudo reboot
sudo apt-get install xdotool wmctrl
sudo apt-get install libinput-tools
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install
cd ..
rm -rf linbinput-gestures

mv ubuntu/libinput-gestures.conf ~/.config/

libinput-gestures-setup autostart
libinput-gestures-setup start
```

safty
ref: https://wayland.freedesktop.org/libinput/doc/latest/touchpad-pressure-debugging.html#
```
# sudo vi /etc/libinput/local-overrides.quirks

[Touchpad touch override]
MatchUdevType=touchpad
MatchName=*Magic Trackpad 2
AttrPressureRange=10:8
```

# Zoom
download: https://zoom.us/download?os=linux

```
sudo apt install ./zoom.deb
```

# gcloud
ref: https://cloud.google.com/sdk/docs/install

```

mkdir ~/work/bin
cd ~/work/bin
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-370.0.0-linux-x86_64.tar.gz
tarload *.tar.gz
rm *.tar.gz
./google-cloud-sdk/install.sh
```

# textlint

set ~/.textlintrc
```
sudo npm install -g textlint
sudo npm install -g textlint-rule-prh textlint-rule-preset-jtf-style textlint-rule-preset-ja-technical-writing
```

# fd

```
cargo install fd-find
```
