 
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
sudo apt-get full-upgrade -y
sudo apt install qemu qemu-kvm libvirt-bin python-paramiko python-pil novnc python-libvirt python-ethtool python-ipaddr python-guestfs libguestfs-tools spice-html5 spice-html5 python-magic keyutils libnfsidmap2 libtirpc1 nfs-common rpcbind python-configobj python-parted -y;
sudo apt install nginx -y
sudo wget https://github.com/kimchi-project/kimchi/releases/download/2.5.0/wok-2.5.0-0.noarch.deb
sudo wget https://github.com/kimchi-project/kimchi/releases/download/2.5.0/kimchi-2.5.0-0.noarch.deb
sudo wget http://kimchi-project.github.io/gingerbase/downloads/latest/ginger-base.noarch.deb
sudo wget http://kimchi-project.github.io/ginger/downloads/latest/ginger.noarch.deb
sudo dpkg -i wok-2.5.0-0.noarch.deb
sudo apt install -f -y
sudo dpkg --ignore-depends=python-imaging -i kimchi-2.5.0-0.noarch.deb
sudo sed -i 's/, python-imaging//g' /var/lib/dpkg/status
sudo apt install -f -y
sudo dpkg -i ginger-base.noarch.deb
sudo apt-get install -f -y
sudo dpkg -i ginger.noarch.deb
sudo apt-get install -f -y
sudo ufw disable
sudo apt-get remove ufw -y
sudo wget -q https://raw.githubusercontent.com/kimchi-project/kimchi/1ec059af4040c50b1a7b9a34253510a46ca09d3b/model/templates.py -O /usr/lib/python2.7/dist-packages/wok/plugins/kimchi/model/templates.py
sudo rm /etc/kimchi/distros.d/ubuntu.json
sudo chmod 777 /etc/kimchi/distros.d/
sudo cat > /etc/kimchi/distros.d/ubuntu.json << EOF
[
    {
        "name": "Ubuntu Server 16.04.6 (Xenial Xerus)",
        "os_distro": "ubuntu",
        "os_arch": "x86_64",
        "os_version": "S16.04.6",
        "path": "http://releases.ubuntu.com/16.04/ubuntu-16.04.6-server-amd64.iso"
    },
    {
        "name": "Ubuntu Server 18.04.3 (Bionic Beaver)",
        "os_distro": "ubuntu",
        "os_arch": "x86_64",
        "os_version": "S18.04.3",
        "path": "http://releases.ubuntu.com/18.04/ubuntu-18.04.3-live-server-amd64.iso"
    },
    {
        "name": "Ubuntu Server 19.04 (Disco Dingo)",
        "os_distro": "ubuntu",
        "os_arch": "x86_64",
        "os_version": "S19.04",
        "path": "http://releases.ubuntu.com/19.04/ubuntu-19.04-live-server-amd64.iso"
    },
    {
        "name": "Ubuntu Desktop 18.04.3 (Bionic Beaver)",
        "os_distro": "ubuntu",
        "os_arch": "x86_64",
        "os_version": "D18.04.3",
        "path": "http://releases.ubuntu.com/18.04/ubuntu-18.04.3-desktop-amd64.iso"
    },
    {
        "name": "Ubuntu Desktop 19.04 (Disco Dingo)",
        "os_distro": "ubuntu",
        "os_arch": "x86_64",
        "os_version": "D19.04",
        "path": "http://releases.ubuntu.com/19.04/ubuntu-19.04-desktop-amd64.iso"
    }
]
EOF
sudo systemctl restart wokd
echo ""
echo ""
echo "DONE!"
echo ""
echo "ACCES Wok via: https://yourip:8001 DONT FORGET HTTPS"
echo "the credentials are the same as your ssh credentials"
echo "if that doesn't help, please visit the kimchi troubleshoot page"
