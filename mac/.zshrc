. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit
source $(dirname $(gem which colorls))/tab_complete.sh
setopt IGNOREEOF
export LANG=ja_JP.UTF-8
autoload -Uz colors
colors
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
alias lst='ls -ltr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias ls="ls -GF"
alias v='vim'
alias vi='vim'
alias vz='vim ~/.zshrc'
alias vx='vim ~/.xonshrc'
PROMPT="%(?.%{${fg[red]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color} %~ %# "
export LSCOLORS=exfxcxdxbxegedabagacad
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt complete_in_word
setopt always_last_prompt
export ZSH_FLAG=true
alias x=xonsh
if [[ "$FROM" = 'xonsh' ]]; then
    echo
else
    x
fi
