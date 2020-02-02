# Fail on first error.
# set -e

# Install latest Cmake.
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main'
sudo apt update
sudo apt install cmake

# Install necessary packages.
# Bash git prompt.
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
# PIP packages.
pip install --user addict \
                   terminaltables \
                   Cython \
                   numba \
                   fire \
                   protobuf \
                   scikit_image \
                   imagecorruptions \
                   sklearn \
                   pyquaternion \
                   cachetools

#Install apex
# git clone https://github.com/NVIDIA/apex
cd ~/shared_dir/apex
pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./

# Install cocoapi.
# git clone https://github.com/cocodataset/cocoapi
cd ~/shared_dir/cocoapi/PythonAPI && sudo /opt/conda/bin/python setup.py install

#git clone https://github.com/traveller59/spconv.git --recursive
cd ~/shared_dir/spconv && git checkout 7342772 && sudo /opt/conda/bin/python setup.py bdist_wheel
cd ~/shared_dir/spconv/dist && pip install * --user

# Install nuscenes.
# git clone https://github.com/poodarchu/nuscenes.git
cd ~/shared_dir/nuscenes && sudo /opt/conda/bin/python setup.py install

# Install Det3D.
cd ~/shared_dir/Det3D && sudo /opt/conda/bin/python setup.py build develop

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