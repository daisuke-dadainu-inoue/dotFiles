# permission rw-r--r--
umask 022
# coredump not create
limit coredumpsize 0
# bindkey reset
bindkey -d

#zstyle
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%F{green}[%b%c%u]%f"
zstyle ':vcs_info:*' actionformats "[%b%c%u][%a]"
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"

# prompt
precmd() { vcs_info }
PROMPT_HOST='%F{magenta}%B%n%b%f@%F{blue}%m%f'
PROMPT='$PROMPT_HOST${vcs_info_msg_0_}[%F{green}%d%f]
%# '
# RPROMPT='[%F{green}%d%f]'

# alias
alias ls='ls -h --color=always'
alias dir='ls --color=auto --format=vertical'
alias ll='ls -al'
alias l='ls -CF'
alias vi='vim'
alias du='du -sh *'
alias open='gnome-open'
alias gnome-terminal='gnome-terminal --hide-menubar --full-screen'
alias grep='grep --color=always'
alias reload='source ~/.zshrc'
alias less='less -NM'
alias tree='tree -aF'
alias vz='vim ~/.zshrc'
alias vv='vim ~/.vimrc'
alias vt='vim ~/.tmux.conf'


