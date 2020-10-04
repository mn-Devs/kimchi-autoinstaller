sudo apt update && sudo apt upgrade -y
sudo apt install qemu qemu-kvm libvirt-bin python-paramiko python-pil novnc python-libvirt python-ethtool python-ipaddr python-guestfs libguestfs-tools spice-html5 spice-html5 python-magic keyutils libnfsidmap2 libtirpc1 nfs-common rpcbind python-configobj python-parted -y
sudo add-apt-repository universe
sudo apt install nginx -y
sudo wget https://github.com/kimchi-project/kimchi/releases/download/2.4.0/wok-2.4.0-0.noarch.deb
sudo wget https://github.com/kimchi-project/kimchi/releases/download/2.4.0/kimchi-2.4.0-0.noarch.deb
sudo wget https://github.com/kimchi-project/kimchi/releases/download/2.4.0/ginger-base-2.3.0-0.noarch.deb
sudo dpkg -i wok-2.4.0-0.noarch.deb
sudo dpkg -i ginger-base-2.3.0-0.noarch.deb
sudo apt install -f -y
sudo dpkg --ignore-depends=python-imaging -i kimchi-2.4.0-0.noarch.deb
sudo ufw disable 
sudo reboot

