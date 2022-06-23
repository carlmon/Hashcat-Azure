#!/bin/bash
set -e
DEBIAN_FRONTEND=noninteractive

# Install required packages
apt update && apt install -y apt-transport-https build-essential

# Blacklist nouveau drivers
cat <<EOT >> /etc/modprobe.d/nouveau.conf
blacklist nouveau
blacklist lbm-nouveau
EOT

# Set up CUDA Toolkit: https://developer.nvidia.com/cuda-downloads
wget --quiet -O /etc/apt/preferences.d/cuda-repository-pin-600 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
wget --quiet -O ./nvidia.pub https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
gpg --no-default-keyring --keyring ./nvidia_keyring.gpg --import ./nvidia.pub
gpg --no-default-keyring --keyring ./nvidia_keyring.gpg --export > /etc/apt/trusted.gpg.d/nvidia.gpg
add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /" -y
apt update && apt install -y nvidia-headless-515 cuda-toolkit-11-7

# Install Hashcat
HASHCAT_SRC_PKG=hashcat-6.2.5
wget https://hashcat.net/files/${HASHCAT_SRC_PKG}.tar.gz
tar -xf ${HASHCAT_SRC_PKG}.tar.gz
cd ${HASHCAT_SRC_PKG}
make && make install

# Install John the Ripper
snap install john-the-ripper

# Install and reference some wordlists
wget --quiet -O /opt/rockyou.txt https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt

cat <<EOF > /opt/wordlists.txt
Get some additional wordlists here:
* https://weakpass.com/download
* https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm
* https://github.com/danielmiessler/SecLists
* https://github.com/FlameOfIgnis/Pwdb-Public
EOF

# Reboot (recommended by CUDA installers)
reboot