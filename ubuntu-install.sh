# this script setup my personal ubuntu setup
# the setup workflow has been used for the following purpose:
# - digital ocean
# - personal desktop
# - perf work desktop



## install basic tools
chmod -R 777 ./
add-apt-repository ppa:jonathonf/vim
apt update && sudo apt upgrade -y
apt install -y git build-essential vim zsh ssh tree clang cmake libboost-dev libssl-dev tmux
apt install -y nodejs npm
apt-get -y install libgl1-mesa-glx nghttp2 libnghttp2-dev libssl-dev

## install `oh-my-zsh`
export GIT_SSL_NO_VERIFY=1
REPO=sjtug/ohmyzsh REMOTE=https://git.sjtu.edu.cn/${REPO}.git sh -c "$(wget -O- https://git.sjtu.edu.cn/sjtug/ohmyzsh/-/raw/master/tools/install.sh\?inline\=false)"
./zsh/install.sh
mv ~/.zshrc ~/.zshrc_old
cp -f zsh/zshrc-linux.conf ~/.zshrc
cp -f zsh/changkun.zsh-theme ~/.oh-my-zsh/themes/ -r
source ~/.zshrc
git clone --depth=1 https://hub.fastgit.xyz/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cp zsh/git.zsh ~/.oh-my-zsh/lib/ -f
source ~/.zshrc
chsh -s `which zsh`

## install ssh
cd ssh
./ssh_create.sh
cd ..

# pip
cd pip
mkdir ~/.pip
cp pip.conf ~/.pip
cd ..

# conda
cd conda
cp -f condarc ~/.condarc
cd ..

# install vim config
# cp -r vim/vimrc.config ~/.vimrc
# mkdir -p ~/.vim/colors/ && cp -r vim/colors/jellybeans.vim ~/.vim/colors/
# git clone https://hub.fastgit.org/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#vim +PluginInstall +GoInstallBinaries +qall
# ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --tern-completer

# cp -f vim/vimrc.config ~/.vimrc
# mkdir -p ~/.vim/colors/
# git clone https://hub.fastgit.org/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# cp -f vim/colors/jellybeans.vim ~/.vim/colors/jellybeans.vim
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.fastgit.org/junegunn/vim-plug/master/plug.vim
# vim +PlugInstall +qall



# install tmux config
git clone --depth=1 https://hub.fastgit.xyz/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
cp -r ~/.tmux/.tmux.conf.local ~/.
cp -r tmux/tmux.local.conf ~/.tmux.conf.local

# fonts
apt-get -y install fonts-powerline

source ~/.zshrc
