#!/bin/bash

set -ex

xcode-select --install

# Set up homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install jq for parsing JSON
brew install jq

brew install git

# tmux
brew install tmux

# Install Python
brew install python
brew install python3

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install some developer tools
# Serverless
npm install -g serverless
# gatsby cli
npm install -g gatsby-cli
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
# Composer & yarn
brew install composer yarn
# Node.js
brew install node
# AWS CLI
brew install awscli

# Install misc programs
brew install --cask 1password
brew install --cask tiles
brew install --cask insomnia
brew install --cask brave-browser
brew install --cask firefox

# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip install --upgrade setuptools
pip install --upgrade pip

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

# Install powerlevel10k for OhMyZsh
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
# pk10k configure

brew install zsh-syntax-highlighting
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Install python 3.x
brew install pyenv
brew install zlib
brew install python
# install poetry
brew install poetry
# Install pipx to manage global packages
python3 -m pip install --user pipx
python3 -m userpath append ~/.local/bin
# Install global packages
python3 -m pipx install flake8
python3 -m pipx install black
# (Really optional, only to protect system python from mistakes)
brew install python@2

pyenv install 3.7.3
pyenv global 3.7.3

echo "alias python=/usr/local/bin/python3.7" >> ~/.zshrc

# TODO Fix
poetry config virtualenvs.in-project true

echo "# pipx
export PATH="~/.local/bin:$PATH"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
 
# commands to override pip restriction above.
# use `gpip` or `gpip3` to force installation of
# a package in the global python environment
# Never do this! It is just an escape hatch.
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
gpip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}" >> ~/.zshrc

# Remove outdated versions from the cellar.
brew cleanup

# Install knex.js
yarn global add knex