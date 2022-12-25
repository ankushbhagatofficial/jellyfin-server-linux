<h2 align="center">Jellyfin Media Server</h1>

<p align="center">
<img alt="Logo Banner" src="https://user-images.githubusercontent.com/74892618/209470135-01e3a239-da65-40d8-a429-cba00eb54be0.png"/>
<br/>
<br/>

### Installation for Linux
```
sudo apt install git -y
git clone https://github.com/ankushbhagatofficial/jellyfin-server-linux
jellyfin-server-linux/jellyfin-installer.sh
```

### Installation for Termux/Android
```
apt install proot proot-distro -y
proot-distro install debian
proot-distro login debian -- apt update
proot-distro login debian -- apt install git sudo -y
proot-distro login debian -- git clone https://github.com/ankushbhagatofficial/jellyfin-server-linux
proot-distro login debian -- jellyfin-server-linux/jellyfin-installer.sh
```

### Start server for Termux/Android
```
proot-distro login debian -- jellyfin
```
