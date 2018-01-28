# 環境変数
export LANG=ja_JP.UTF-8
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

case ${OSTYPE} in
    darwin*)
        export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
        PATH=${JAVA_HOME}/bin:${PATH}
        ;;
    linux*)
        ;;
esac

# ヒストリの設定
export HISTFILE=~/.zsh/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000


