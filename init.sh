sudo yum clean all
sudo yum -y update
sudo yum -y upgrade

# java develop
sudo yum -y install httpd java-1.8.0.-openjdk java-1.8.0.-openjdk-devel
curl http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.tar.gz | tar zxv -C /usr/local/
ln -s /usr/local/apache-tomcat-8.0.53 /usr/local/tomcat
sudo systemctl start httpd
sudo systemctl enable httpd

# docker
sudo systemctl start docker
sudo systemctl enable docker

# develop tool
sudo yum -y groupinstall "Development Tools"
sudo yum -y install bash-completion

# install tool
sudo yum -y install libevent-devel
sudo yum -y install ncurses-devel

# ripgrep
sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
sudo yum -y install ripgrep

# tree
sudo yum -y install tree

# zsh
sudo yum -y install zsh

 # ripgrep
sudo yum -y install ripgrep

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

