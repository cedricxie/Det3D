# Fail on first error.
# set -e

# Install latest Cmake.
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main'
sudo apt update
sudo apt install cmake

# Install necessary packages.
# Bash Git Prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Install visual studio code.
cd ~/
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb
sudo dpkg -i vscode.deb
sudo apt-get -y -f install
rm vscode.deb

# Configure git.
git config --global user.email "cedric_xie@hotmail.com" 
git config --global user.name "Yuesong Xie"
git config --global credential.helper "cache --timeout=36000"