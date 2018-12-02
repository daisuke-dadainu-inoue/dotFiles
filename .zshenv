# path
export PATH=~/bin:$PATH
# fpath
if [ -e ~/.zsh/zsh-completions ]; then
  fapath=(~/.zsh/zsh-completions $fpath)
fi

# import
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

# ls command colors
eval `dircolors -b`
#export LSCOLORS=exfxcxdxbxegedabagacad
#export LS_COLOR='di=34;ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:tw=42;30:ow=43;30'

# autoload
autoload -Uz compinit && compinit -u
autoload -Uz vcs_info
autoload -Uz colors && colors

# history
# history file
HISTFILE=~/.zsh_history
# history size in memory
HISTSIZE=100000
# the number of histsize
SAVEHIST=1000000
# the size of asking history
export LISTMAX=50

# setopt
# delete previous command duplication
setopt hist_ignore_dups
# do not leave the same command in the history
setopt hist_ignore_all_dups
# sharing history between zsh that started at the same time
setopt share_history
# xvfg
unsetopt BG_NICE
# stuffing completion candidates
setopt list_packed
# correct command spelling
setopt correct
setopt no_beep
setopt prompt_subst
unsetopt list_types

# fzf
export FZF_DEFAUKT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAUKT_OPTS='--height 40% --reverse --border'

# nvm
export NVM_DIR=$HOME/repos/nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


