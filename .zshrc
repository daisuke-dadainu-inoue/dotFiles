# 環境変数
export LANG=ja_JP.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

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
PROMPT='$PROMPT_HOST $(update_git_info) %# '
RPROMPT='[%F{green}%d%f]'

git_is_track_branch() {
    if [ "$(git remote 2>/dev/null)" != "" ]; then
        local target_tracking_branch="origin/$(git rev-parse --abbrev-ref HEAD)"
        for tracking_branch in $(git branch -ar) ; do
            if [ "$target_tracking_branch" = "$tracking_branch" ]; then
                echo "true"
            fi
        done
    fi
}

git_info_pull() {
    if [ -n "$(git_is_track_branch)" ]; then
        local current_bransh="$(git rev-parse --abbrev-ref HEAD)"
        local head_rev="$(git rev-parse HEAD)"
        local origin_rev="$(git rev-parse origin/$current_branch)"
        if [ "$head_rev" != "$origin_rev" ] && [ "$(git_info_push)" = "" ]; then
            echo " Can Be Pushed"
        fi
    fi
}

git_info_push() {
    if [ -n "$(git_is_track_branch)" ]; then
        local current_branch="$(git rev-parse --abbrev-ref HEAD)"
        local push_count=$(git rev-list origin/"$current_branch".."$current_branch" 2>dev/null | wc -l)
        if [ "$push_count" -gt 0]; then
            echo " Can Be Pushed($push_count)"
        fi
    fi
}

function update_git_info() {
    LANG=en_US.UFT-8 vcs_info
    _vcs_info=$vcs_info_msg_0_
    BG_COLOR=green
    FG_COLOR=black
    if [ -n "$_vcs_info" ]; then
        if [[ -n `echo $_vcs_info | grep -Ei "merge|unstaged|staged" 2> /dev/null` ]]; then
            BG_COLOR=red
            FG_COLOR=white
        fi
        echo "%{${bg[$BG_COLOR]}%}%{${fg[$FG_COLOR]}%}$_vcs_info%{${reset_color}%}%{${reset_color}%}%{${fg[$BG_COLOR]}%}⮀%{${reset_color}%}"
    else
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
alias vz='vim ~/.zshrc'
alias vv='vim ~/.vimrc'

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

case ${OSTYPE} in
    darwin*)
        source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
        PATH=${JAVA_HOME}/bin:${PATH}
        source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
        ;;
    linux*)
        source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
        ;;
esac


