#!/bin/sh

echo '[1/11] Installing Homebrew...'
echo 'This will install Command Line Tools if needed (it may take a while)'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo '[2/11] Installing git...'
brew update
brew upgrade
brew install git
mkdir -p ~/Development
git clone https://gitlab.com/renemn/dotfiles.git ~/Development/dotfiles
cd ~/Development/dotfiles
DOTFILES_PATH=$(pwd)
ln -sf $DOTFILES_PATH/git/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_PATH/git/.gitignore_global ~/.gitignore_global

echo '[3/11] Installing zsh...'
brew install zsh
# curl -sL git.io/antibody | sh -s
brew install getantibody/tap/antibody
ln -sf $DOTFILES_PATH/zsh/.zshrc ~/.zshrc
grep -q -f $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)

echo '[4/11] Installing node with nvm...'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node

echo '[5/11] Installing silver searcher (ag)...'
brew install the_silver_searcher

echo '[6/11] Installing fzy...'
brew install fzy

echo '[7/11] Installing hyper...'
brew cask install hyper
rm -rf ~/.hyper.js
ln -sf $DOTFILES_PATH/hyper/.hyper.js ~/.hyper.js
git clone https://github.com/powerline/fonts.git ~/Development/fonts
cd ~/Development/fonts
./install.sh
cd ..
rm -rf ./fonts

echo '[8/11] Installing vscode and some extensions...'
brew cask install visual-studio-code
VSCODE_EXTENSIONS=(
  dbaeumer.vscode-eslint
  file-icons.file-icons
  yzhang.markdown-all-in-one
  christian-kohler.npm-intellisense
  christian-kohler.path-intellisense
  esbenp.prettier-vscode
  naumovs.theme-oceanicnext
  wayou.vscode-todo-highlight
  jpoissonnier.vscode-styled-components
)
for VSCODE_EXT in "${VSCODE_EXTENSIONS[@]}"
  do code --install-extension $VSCODE_EXT
done

echo '[9/11] Installing chrome...'
brew cask install google-chrome

echo '[10/11] Installing slack...'

echo '[11/11] Setting up system configurations...'
brew cleanup
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.dock autohide -bool true
defaults write NSGlobalDomain AppleInterfaceStyle Dark
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

echo 'Done!'
echo 'You need to restart for system configurations take effect.'
