#!/bin/bash
set -e
echo ""
echo ""
echo "                            ██████████                               "  
echo "                           ░░███░░░░███                              "
echo " █████████████   ████████   ░███   ░░███  ██████  █████ █████  █████ "
echo "░░███░░███░░███ ░░███░░███  ░███    ░███ ███░░███░░███ ░░███  ███░░  "
echo " ░███ ░███ ░███  ░███ ░███  ░███    ░███░███████  ░███  ░███ ░░█████ "
echo " ░███ ░███ ░███  ░███ ░███  ░███    ███ ░███░░░   ░░███ ███   ░░░░███"
echo " █████░███ █████ ████ █████ ██████████  ░░██████   ░░█████    ██████ "
echo "░░░░░ ░░░ ░░░░░ ░░░░ ░░░░░ ░░░░░░░░░░    ░░░░░░     ░░░░░    ░░░░░░  "
echo ""
echo ""
echo "               __           .__                 __         .__  .__   "
echo "_____   __ ___/  |_  ____   |__| ____   _______/  |______  |  | |  |  "
echo "\__  \ |  |  \   __\/  _ \  |  |/    \ /  ___/\   __\__  \ |  | |  |  "
echo " / __ \|  |  /|  | (  <_> ) |  |   |  \\___ \  |  |  / __ \|  |_|  |__"
echo "(____  /____/ |__|  \____/  |__|___|  /____  > |__| (____  /____/____/"
echo "     \/                             \/     \/            \/           "
echo ""
echo "v1"
echo ""
sudo apt-get update
sudo apt-get upgrade
sudo apt install qemu qemu-kvm libvirt-bin python-paramiko python-pil novnc python-libvirt python-ethtool python-ipaddr python-guestfs libguestfs-tools spice-html5 spice-html5 python-magic keyutils libnfsidmap2 libtirpc1 nfs-common rpcbind python-configobj python-parted -y
sudo add-apt-repository universe
sudo apt install -f -y
sudo apt install nginx -y
sudo wget https://github.com/kimchi-project/kimchi/releases/download/2.4.0/wok-2.4.0-0.noarch.deb
sudo wget https://github.com/kimchi-project/kimchi/releases/download/2.4.0/kimchi-2.4.0-0.noarch.deb
sudo wget https://github.com/kimchi-project/kimchi/releases/download/2.4.0/ginger-base-2.3.0-0.noarch.deb
sudo dpkg -i wok-2.4.0-0.noarch.deb
sudo apt install -f -y
sudo dpkg -i wok-2.3.0-0.noarch.deb
sudo apt install -f -y
sudo dpkg --ignore-depends=python-imaging -i kimchi-2.4.0-0.noarch.deb
sudo ufw disable
echo ""
echo ""
echo "DONE!"
echo ""
echo "ACCES Wok via: https://yourip:8001"
echo "the credentials are the same as your ssh credentials"
echo "reboot if you have issues with wok"
echo "if that doesn't help, please visit the kimchi troubleshoot page"
