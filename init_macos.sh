#!/bin/bash

set -ex

xcode-select --install

# Set up homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off

echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

# Utilities
brew install \
    bash-completion `: autocompletion for bash terminal` \
    htop            `: better top` \
    iftop           `: top for network I/O` \
    jq              `: parse and prettify json` \
    ngrep           `: read network traffic` \
    nmap            `: network map` \
    tree            `: recursive ls` \
    wget            `: curl alternative` \
    vim             `: install vim 8.0` \


echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile

source ~/.bash_profile

brew install git

# Python
brew install python
brew install python3

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip install --upgrade setuptools
pip install --upgrade pip

brew install gnu-sed --with-default-names

# Heroku
brew install heroku-toolbelt
heroku update
heroku login
mkdir ~/.ssh
ssh-keygen -t rsa
heroku keys:add

# Postgresql
brew install postgresql
initdb /usr/local/var/postgres

# Mysql
brew install mysql
brew cask install mysqlworkbench

# Vscode
brew cask install visual-studio-code

# Iterm2
brew cask install iterm2

# Bash git-prompt
brew install bash-git-prompt

# Mailhog
brew install mailhog

brew cask install kdiff3

# Composer & yarn
brew install composer yarn

# Node.js
brew install node

# Git configurations
#git config --global user.name
#git config --global user.email
#git config --global credential.helper osxkeychain
git config --global color.ui auto

# MacOS gitignore by github
curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore -o ~/.gitignore

# Collection of vim configuration and plugins
git clone https://github.com/square/maximum-awesome.git
cd maximum-awesome
rake

# ohmyzsh: https://github.com/ohmyzsh/ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# https://github.com/agnoster/agnoster-zsh-theme
# TODO Change .zshrc line to ZSH_THEME="agnoster"
# install powerlines/f
# clone
cd ~/
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# or https://medium.com/@genealabs/agnoster-theme-on-os-x-391d60effaf6

brew install zsh-syntax-highlighting

echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized

# TODO https://github.com/zsh-users/zsh-completions
# TODO https://github.com/djui/alias-tips

