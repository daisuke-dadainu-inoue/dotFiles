export ZDOTDIR=$HOME/.zsh

case ${OSTYPE} in
    darwin*)
        source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
        ;;
    linux*)
        source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
        ;;
esac

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000


