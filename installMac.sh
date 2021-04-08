#!/bin/bash
######################
# This script installs all my necessary tools for mac
# WIP
#####################

echo "Starting install process..."
echo "Installing Homebrew..."

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Done"
echo "Installing zsh..."

# install zsh
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Done"
echo "Installing zsh and terminal plugins"


# install tools needed for zsh
brew install git 
brew install tmux
brew install gnupg
brew install fzf
brew install autojump
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
brew install npm
# install spaceship theme for zsh
npm install -g spaceship-prompt

### install powerline fonts for terminal
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
### end of powerline fonts

### install several tools and programs

echo "Done"
echo "Installing tools..."

brew install fish
brew install vim
brew install tldr
brew install nvim
brew install --cask visual-studio-code
brew install lazygit
brew install --cask alfred
brew install --cask brave-browser
brew install --cask firefox
brew install nativefier
brew install --cask keepassxc
brew install --cask nextcloud
brew install --cask iterm2
brew install --cask obsidian
brew install --cask spectacle
brew install --cask spotify

### end of install programs

echo "Done"

### set fish to default
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

### install Doom Emacs

# required dependencies
brew install ripgrep
# optional dependencies
brew install coreutils fd
# Installs clang
xcode-select --install

# install emacs mac port from recommended source
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules
ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app

# install Doom emacs
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

### end of install Doom Emacs

#############################
echo "Setting up dotfiles..."

# run the dotfiles install script
chmod +x ./installDotfiles.sh
exec ./installDotfiles.sh

echo "Done"
