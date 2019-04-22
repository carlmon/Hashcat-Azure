#!/bin/bash

# Install required packages
apt-get update 2>error
apt-get install -y build-essential p7zip-full 2>error # Not installing 'ubuntu-desktop'

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
wget https://hashcat.net/files/hashcat-5.1.0.7z
7z x hashcat-5.1.0.7z
cd hashcat-5.1.0
cp hashcat64.bin /usr/bin/
ln -s /usr/bin/hashcat64.bin /usr/bin/hashcat
cp -Rv OpenCL/ /usr/bin/
cp hashcat.hcstat2 /usr/bin/
cp hashcat.hctune /usr/bin/