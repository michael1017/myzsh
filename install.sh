#!/bin/bash -e

# backup original tmux configuration
mv $HOME/.zshrc $HOME/zshrc_backup.$(date "+%Y.%m.%d-%H:%M:%S")

# install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install oh-my-zsh plugin
cd $HOME/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git

# clone from github
git clone https://github.com/michael1017/myzsh.git $HOME/toolchains/myzsh
cd $HOME/toolchains/myzsh 
mkdir zshrc_backup

# creaet symbolic link to $HOME
mv $HOME/.zshrc $HOME/zshrc_backup.$(date "+%Y.%m.%d-%H:%M:%S").2
mv $HOME/zshrc_backup* $PWD/zshrc_backup
ln -s $PWD/.zshrc $HOME/

touch $HOME/.zsh_profile
touch $HOME/.zshenv

exec zsh
