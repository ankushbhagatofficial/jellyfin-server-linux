# jellyfin-server-linux

### Installation for Linux
```
apt install git -y
git clone https://github.com/ankushbhagatofficial/jellyfin-server-linux ~/jellyfin-server-linux
~/jellyfin-server-linux/jellyfin-installer.sh
```

### Installation for Termux/Android
```
apt install proot proot-distro -y
proot-distro install debian
proot-distro login debian -- apt update
proot-distro login debian -- apt install git sudo -y
proot-distro login debian -- git clone https://github.com/ankushbhagatofficial/jellyfin-server-linux
proot-distro login debian -- ~/jellyfin-server-linux/jellyfin-installer.sh
```
