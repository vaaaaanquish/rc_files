# Ubuntu 20.04 settings

# I/O driver
keyboard, touchpad, network, display

ref: https://askubuntu.com/posts/1324339/revisions
```
sudo add-apt-repository ppa:canonical-hwe-team/backport-iwlwifi
sudo apt update
sudo apt upgrade
sudo apt install -y backport-iwlwifi-dkms gcc make git build-essential

# sudo apt install linux-firmware
# sudo apt install linux-oem-osp1

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
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get update
sudo apt-get -y install cuda
```

# cudnn
```
# https://developer.nvidia.com/cudnn
# login and download deb
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
# autokey settings copy folder ~/.config/autokey/data/keybindings
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

# Albert

```
curl "https://build.opensuse.org/projects/home:manuelschneid3r/public_key" | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt update
sudo apt install albert

# setting albelt
# meta + space
# startup
# and extensions
```


# terminal

```
sudo apt install guake
# guake settings 

sudo apt install copyq
sudo apt install wmctrl
# ubuntu settings -> keybord shortcuts -> alt+hoge, super+hoge disable
# extention -> python -> wmctrl, copyq
```


# discord

```
# https://discord.com/ download deb
sudo apt install discord.deb
```


# Python, ruby, node, tools 

```
sudo apt install libncurses5-dev
sudo apt install python-is-python3 python3-pip libpython3.8-dev
sudo apt intall ruby ruby-dev
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
sudo apt install fd-find
```
```
pip install -r requirements.txt  # from github

jupyter serverextension enable --py jupyterlab --sys-prefix
jupyter notebook --generate-config
```
```
sudo apt install libssl1.1=1.1.1f-1ubuntu2
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt -y update
sudo apt -y install nodejs
sudo npm install -g yarn
```
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
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
mv molokai/colors ~/.config/nvim/

cd ~/.cache/dein/repos/github.com/neoclide/coc.nvim
yarn install
yarn build

mkdir ~/.config/nvim/bundle
cd ~/.config/nvim/bundle
git clone https://github.com/kassio/neoterm.git

mkdir -p ~/.local/share/nvim/site/pack/nvim-treesitter/start
cd ~/.local/share/nvim/site/pack/nvim-treesitter/start
git clone https://github.com/nvim-treesitter/nvim-treesitter.git
```
```
sudo apt install xsel
```
```
:call coc#util#install()
:CocInstall coc-json
:TSIntall all
```

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

# zsh

```
sudo apt install -y zsh
```

# rc
```
vim ~/.zshrc
vim ~/.bashrc
```
```
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export ZSH_FLAG="true"  # zsh only
. "$HOME/.cargo/env"

xonsh
```

