#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# dotfiles directory
dir=~/dotfiles

# old dotfiles backup directory
olddir=~/dotfiles_old

# list of files/folders to symlink in homedir
# currently not in use, need to set this up again
# files="bashrc fzf.bash fzf.zsh gitignore gitconfig tigrc vimrc vim zshrc"
files=""

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# lazygit
mv ~/Library/Application\ Support/lazygit/config.yml ~/dotfiles_old/lazygitconf.yml
ln -s ~/dotfiles/lazygitconf.yml ~/Library/Application\ Support/lazygit/config.yml

# .config directoy
mv ~/.config ~/dotfiles_old/config
ln -s ~/dotfiles/config ~/.config

# vimrc
# update ultimate vimrc submodule to pull it
git submodule update
# link overwrite config of ultimate vimrc submodule
ln -s ~/dotfiles/vim_my_configs.vim ~/dotfiles/vim_runtime/my_configs.vim

