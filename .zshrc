autoload -Uz colors
colors

PROMPT="%F{green}[%n %c]$%f"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "!"
zstyle ':vcs_info:git:*' unstagedstr "+"
zstyle ':vcs_info:*' formats "%F{yellow}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats "[%b|%a]"
precmd () { vcs_info }
RPROMPT=$RPROMPT"${vcs_info_msg_0_}"

#rbenv
eval "$(rbenv init -)"

alias e='emacs'
#ls
case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G"
    ;;
linux*)
    alias ls="ls --color"
esac
alias ll='ls -l'
alias la='ls -a'
#git
alias gs='git st'
alias gd='git diff'
alias gb='git branch'
alias gg='git grep'

#保管機能の強化
autoload -Uz compinit
compinit
#同じディレクトリをpushdしない
setopt pushd_ignore_dups
#ディレクトリ名でcd
setopt auto_cd
setopt auto_pushd

#history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000
#直前と同じコマンドをhistoryに追加しない
setopt hist_ignore_dups
setopt share_history
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
stty -ixon

#サジェスト
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'
