# permission rw-r--r--
# 新規ファイルor新規ディレクトリを作成した時に設定するファイル属性
umask 022

# coredump not create
# プロセスが異常終了した時のメモリ内容のダンプファイルサイズ
limit coredumpsize 0

# bindkey reset
# キーバインドをリセット
bindkey -d

# zstyle
# 部分補完の検索対象
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[-_.]=**'
# 補完関数の表示を過剰に
zstyle ':completion:*' verbose yes

# zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%F{green}[%b%c%u]%f"
zstyle ':vcs_info:*' actionformats "[%b%c%u][%a]"
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"

# prompt
precmd() { vcs_info }
PROMPT_HOST='%F{green}%B%n%b%f@%F{green}%m%f'
PROMPT='$PROMPT_HOST${vcs_info_msg_0_}[%F{green}%d%f]
%# '

# alias
alias ll='ls -alG'
alias vi='vim'
alias tree='tree -aF'
alias vz='vim ~/.zshrc'
alias vv='vim ~/.vimrc'
alias vt='vim ~/.tmux.conf'
alias ide='tmux new-session \; source-file ~/.tmux/session'
alias ide-split='tmux source-file ~/.tmux/session'
alias chrome='open -a /Applications/Google\ Chrome.app'

