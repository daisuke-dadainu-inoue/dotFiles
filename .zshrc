# permission rw-r--r--
# 新規ファイルor新規ディレクトリを作成した時に設定するファイル属性
umask 022

# coredump not create
# プロセスが異常終了した時のメモリ内容のダンプファイルサイズ
limit coredumpsize 0

# bindkey reset
# キーバインドをリセット
bindkey -d
bindkey -e

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
RPROMPT='%F{green} %D{%Y/%m/%d} %* %f'

# alias
alias reload='source ~/.zshrc'
alias ll='ls -alG'
alias vi='vim'
alias tree='tree -aF'
alias vz='vim ~/.zshrc'
alias vv='vim ~/.vimrc'
alias vt='vim ~/.tmux.conf'
alias ide='tmux new-session \; source-file ~/.tmux/session'
alias ide-split='tmux source-file ~/.tmux/session'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias myhelp='cat ~/bin/myhelp | less'
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

# pyenv
eval "$(pyenv init -)"
export PIPENV_VENV_IN_PROJECT=true


export NVM_DIR="$HOME/repos/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
export PIPENV_VENV_IN_PROJECT=true

# postgresql
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PGPASSWORD=postgres

# mysql
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

