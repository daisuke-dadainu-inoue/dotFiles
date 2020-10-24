# ripgrep
brew install ripgrep

# repos
mkdir ~/repos

# vim
cd ~/repos
git clone https://github.com/vim/vim.git
cd vim
./configure && make
make install

# dotfiles
cd ~/repos
git clone https://github.com/daisuke-dadainu-inoue/dotFiles.git

# automake
brew install autoconf
brew install automake
brew install m4
brew install libtool
brew install libevent
brew install perl
brew install pkg-config
brew install reattach-to-user-namespace

# tmux
cd ~/repos
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make

# fzf
cd ~/repos
git clone https://github.com/junegunn/fzf.git
cd fzf
./install

# tig
cd ~/repos
git clone https://github.com/jonas/tig.git
cd tig
make
make install

# nvm
cd ~/repos
git clone https://github.com/creationix/nvm.git
cd nvm
git checkout v0.33.11
chmod +x nvm.sh

# zsh lib download
cd ~
mkdir .zsh
cd .zsh
git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-history-substring-search.git

# ln
cd ~
ln -s ~/repos/dotFiles/.zshenv ~/.zshenv
rm .zshrc
ln -s ~/repos/dotFiles/.zshrc ~/.zshrc
ln -s ~/repos/dotFiles/.vimrc ~/.vimrc
ln -s ~/repos/dotFiles/.tmux.conf ~/.tmux.conf
ln -s ~/repos/tmux/tmux ~/bin/tmux
ln -s ~/repos/vim/src/vim ~/bin/vim
ln -s ~/.fzf.zsh ~/bin/.fzf.zsh

chsh -s /bin/zsh

