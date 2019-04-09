#!/bin/sh

echo '[1/10] Installing Homebrew...'
echo 'This will install Command Line Tools if needed (it may take a while)'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo '[2/10] Installing git...'
brew update
brew upgrade
brew install git
mkdir -p ~/Development
git clone https://gitlab.com/renemn/dotfiles.git ~/Development/dotfiles
cd ~/Development/dotfiles
DOTFILES_PATH=$(pwd)
ln -sf $DOTFILES_PATH/git/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_PATH/git/.gitignore_global ~/.gitignore_global

echo '[3/10] Installing zsh...'
brew install zsh
grep -q -f $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)

echo '[4/10] Installing node'

echo '[3/10] Installing silver searcher (ag)...'
brew install the_silver_searcher

echo '[4/10] Installing fzy...'
brew install fzy

echo '[4.1/10] Installing hyper...'
brew cask install hyper

echo '[4.1/1-] Installing vscode...'
brew cask install visual-studio-code

echo '[4.1/10] Installing chrome...'
brew cask install google-chrome

echo '[4.2'

echo 'Cleaning brew...'
brew cleanup

echo '[5/5] Setting up system configurations...'
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.dock autohide -bool true
defaults write NSGlobalDomain AppleInterfaceStyle Dark
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

echo 'Done!'
echo 'You need to restart for system configurations take effect.'
