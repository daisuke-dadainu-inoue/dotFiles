# path
# ユーザーローカルbinフォルダをpathに含める
export PATH=~/bin:$PATH

# fpath
# 補完機能ライブラリ
if [ -e ~/.zsh/zsh-completions ]; then
  fapath=(~/.zsh/zsh-completions $fpath)
fi

# import
# コマンド候補履歴から表示
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# コマンドをシンタックスハイライト
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# 履歴検索
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -f ~/bin/.fzf.zsh ] && source ~/.fzf.zsh

# lang
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# editor
export VIM=~/repos/vim
export EDITOR=vim
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# autoload
# -Uはaliasを干渉させない
# compinitは補完機能を有効化
# cominit -uはセキュリティチェックを避けて全ファイルを警告なしに使用
autoload -Uz compinit && compinit -u
# vcs_infoはバージョン情報の取得（svc, git）
autoload -Uz vcs_info
# colorsは色指定を色名で指定できる（black, red, green, yellow, blue, magenta, cyan, white）
autoload -Uz colors && colors

# history
# history file
export HISTFILE=~/.zsh_history
# ファイルに記録できるコマンド履歴の件数
export HISTFILESIZE=100000
# 実行中シェルコマンドをメモリ上にキャッシュする件数
export HISTSIZE=100000
# the number of histsize
# シェル終了時に.historyに保存するコマンド件数
export SAVEHIST=1000000
# zshの補完候補が画面から溢れ出るとき、それでも表示するか確認
export LISTMAX=50

# setopt
# do not leave the same command in the history
# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
# 重複するコマンド行は古い方を削除
setopt hist_ignore_all_dups
# コマンド履歴ファイルを共有
setopt share_history
# xvfg
# バックグランドジョブの優先度（ionice）をbashと同じ挙動に
unsetopt BG_NICE
# stuffing completion candidates
# 補完候補を詰めて表示
setopt list_packed
# correct command spelling
# ビープ音を鳴らさない
setopt no_beep
# PROMPT変数内で変数を参照
setopt prompt_subst
# ファイル種別記号を補完候補の末尾に表示しない
unsetopt list_types

# fzf
# デフォルトの検索コマンド指定
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
# デフォルトのオプション指定
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# nvm
export NVM_DIR=$HOME/repos/nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

