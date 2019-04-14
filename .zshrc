autoload -U compinit; compinit 
setopt auto_cd
alias ...='cd ../..'
alias ....='cd ../../..'
hash -d hoge=/long/path/to/hogehoge
setopt auto_pushd
setopt pushd_ignore_dups
setopt IGNOREEOF
export LANG=ja_JP.UTF-8
export PATH="/Users/vanquish/homebrew/bin:$PATH"
export PATH="$HOME/bin:$PATH"
autoload -Uz colors
colors
setopt share_history
setopt histignorealldups
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
alias lst='ls -ltr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias so='source'
alias v='vim'
alias vi='vim'
alias vz='vim ~/.zshrc'
alias c='cdr'
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm'
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'
cdpath=(~)
PROMPT="%(?.%{${fg[red]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color} %~ %# "
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls -GF"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
test -r /sw/bin/init.sh && . /sw/bin/init.sh
setopt complete_in_word
setopt always_last_prompt

# env
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export VISUAL='/usr/bin/vim'
export PATH=$HOME/.nodebrew/current/bin:$PATH
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

alias x=xonsh
xonsh
