# 直前のコマンドの重複を削除
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 同時に起動したzshの間でヒストリを共有
setopt share_history

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

# コマンドのスペルを訂正
setopt correct

# ビープ音を鳴らさない
setopt no_beep

# prompt
autoload -Uz vcs_info
autoload -U colors
colors

setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "⭠ %b%c%u"
zstyle ':vcs_info:git:*' actionformats '⭠ %b%c%u ⮁ %a'
zstyle ':vcs_info:git:*' stagedstr " staged"
zstyle ':vcs_info:git:*' unstagedstr " unstaged"

precmd() { vcs_info }
PROMPT_HOST='%F{magenta}%B%n%b%f@%F{blue}%m%f'
PROMPT='$PROMPT_HOST $(updateGitInfo) %# '
RPROMPT='[%F{green}%d%f]'

function updateGitInfo() {
    LANG=en_US.UFT-8 vcs_info
    _vcs_info=$vcs_info_msg_0_
    BG_COLOR=green
    FG_COLOR=black
    _git_info_push=$(gitInfoPush)
    _git_info_pull=$(gitInfoPull)
    if [ -n "$_vcs_info" ]; then
        if [ -n "$_git_info_push" ] || [ -n "$_git_info_pull" ]; then
            BG_COLOR=yellow
            FG_COLOR=black
        fi
        if [[ -n `echo $_vcs_info | grep -Ei "merge|unstaged|staged" 2> /dev/null` ]]; then
            BG_COLOR=red
            FG_COLOR=white
        fi
        echo "%{${bg[$BG_COLOR]}%}%{${fg[$FG_COLOR]}%}$_vcs_info$_git_info_push$_git_info_pull%{${reset_color}%}%{${reset_color}%}%{${fg[$BG_COLOR]}%}⮀%{${reset_color}%}"
    fi
}

# alias
alias ls='ls -aF'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias cat='cat -n'
alias less='less -NM'
alias tree='tree -aF'
alias vz='vim ~/.zsh/.zshrc'
alias vv='vim ~/.vimrc'

