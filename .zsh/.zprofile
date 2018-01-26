# 環境変数
export LANG=ja_JP.UTF-8
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

# ヒストリの設定
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000


