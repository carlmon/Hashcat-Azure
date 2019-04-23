#!/bin/bash

# Install required packages
apt-get update 2>error
apt-get install -y build-essential 2>error # Not installing 'ubuntu-desktop'

# Blacklist nouveau drivers
cat <<EOT >> /etc/modprobe.d/nouveau.conf
blacklist nouveau
blacklist lbm-nouveau
EOT

# Set up GRID drivers
wget -O NVIDIA-Linux-x86_64-grid.run https://go.microsoft.com/fwlink/?linkid=874272
chmod +x NVIDIA-Linux-x86_64-grid.run
./NVIDIA-Linux-x86_64-grid.run -s>error
cp /etc/nvidia/gridd.conf.template /etc/nvidia/gridd.conf
sed -e "\$aIgnoreSP=FALSE" /etc/nvidia/gridd.conf

# Set up hashcat
wget https://hashcat.net/files/hashcat-5.1.0.tar.gz
tar -xf hashcat-5.1.0.tar.gz
cd hashcat-5.1.0
make && make install