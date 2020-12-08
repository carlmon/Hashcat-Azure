#!/bin/bash

# Install required packages
apt-get update
apt-get install -y apt-transport-https build-essential

# Blacklist nouveau drivers
cat <<EOT >> /etc/modprobe.d/nouveau.conf
blacklist nouveau
blacklist lbm-nouveau
EOT

# Set up CUDA drivers: http://developer.download.nvidia.com/compute/cuda/repos/
CUDA_REPO_PKG=cuda-repo-ubuntu1804_10.2.89-1_amd64.deb
wget --quiet -O /tmp/${CUDA_REPO_PKG} https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/${CUDA_REPO_PKG}
dpkg -i /tmp/${CUDA_REPO_PKG}
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
rm -f /tmp/${CUDA_REPO_PKG}
apt-get update
apt-get install -y cuda-drivers nvidia-cuda-toolkit

# Install Hashcat
HASHCAT_SRC_PKG=hashcat-6.1.1
wget https://hashcat.net/files/${HASHCAT_SRC_PKG}.tar.gz
tar -xf ${HASHCAT_SRC_PKG}.tar.gz
cd ${HASHCAT_SRC_PKG}
make && make install

# Install John the Ripper
snap install john-the-ripper

# Install some wordlists
mkdir /opt/wordlists
cd /opt/wordlists
wget --quiet https://crackstation.net/files/crackstation-human-only.txt.gz && gunzip crackstation-human-only.txt.gz
# wget --quiet https://crackstation.net/files/crackstation.txt.gz && gunzip -d crackstation.txt.gz
wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/darkweb2017-top1000.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/darkweb2017-top10000.txt
wget https://github.com/FlameOfIgnis/Pwdb-Public/raw/master/wordlists/ignis-10M.txt