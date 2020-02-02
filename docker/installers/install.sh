# Fail on first error.
set -e

# Install necessary apps.
apt-get update && apt-get install -y apt-utils \
                                     autoconf \
                                     nano \
                                     wget \
                                     libboost-all-dev \
                                     software-properties-common \
                                     python-setuptools \
                                     sudo \
                                     mlocate \
                                     libsm6 \
                                     libxext6 \
                                     libxrender-dev

# Update for locate.
updatedb

# Install user.
USER_NAME=yxie

adduser --disabled-password --gecos '' ${USER_NAME}
usermod -aG sudo ${USER_NAME}
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

echo """
ulimit -c unlimited
export PATH=~/miniconda3/bin:$PATH
export GIT_SSL_NO_VERIFY=1
alias srcfg='source ~/shared_dir/Profile/config.sh'
""" >> /home/${USER_NAME}/.bashrc
