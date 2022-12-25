#!/bin/bash

echo -e "\e[92m[Processing jellyfin installation]...\e[0m\n"

if [[ ! -d jellyfin-server ]]
then
mkdir jellyfin-server
fi

cd jellyfin-server

dir=$(pwd)

sys_architecture=$(dpkg --print-architecture)

if [[ ${sys_architecture} == "aarch64" ]]
then
sys_architecture=arm64
fi

wget https://repo.jellyfin.org/releases/server/linux/stable/combined/jellyfin_10.8.8_${sys_architecture}.tar.gz -O jellyfin_10.8.8_${sys_architecture}.tar.gz
tar -xf jellyfin_10.8.8_${sys_architecture}.tar.gz

sudo ln -s jellyfin_10.8.8 jellyfin

if [[ ! -d log ]]
then
mkdir data cache config log
fi

    distro=$(source /etc/os-release && echo $ID)
    case $distro in
        arch)
            pm() {
                sudo pacman -Sy --noconfirm $1
                }
            ;;
        ubuntu)
            pm() {
                sudo apt-get install -y $1
                }
            ;;
        linuxmint)
            pm() { sudo apt-get install -y $1
                }
            ;;
        kali)
            pm() { sudo apt-get install -y $1
                }
            ;;
        parrot)
            pm() { sudo apt-get install -y $1
                }
            ;;
        debian)
            pm() { sudo apt-get install -y $1
                }
            ;;
        void)
            pm() { sudo xbps-install $1
                }
            ;;
        manjaro*)
            pm() { sudo pacman -Sy $1
                }
            ;;
        garuda)
            pm() { sudo pacman -Sy $1
                }
            ;;
        alpine)
            pm() { sudo apk add $1
                }
            ;;
        gentoo)
            pm() { sudo emerge --ask $1
                }
            ;;
        fedora)
            pm() { sudo dnf install -y $1
                }
            ;;
        predator)
            pm() { sudo pacman -Sy --noconfirm $1
                }
            ;;
        artix)
            pm() { sudo pacman -Sy --noconfirm $1
                }
            ;;
        puppy_fossapup64)
            pm() { sudo pkg -d $1 && sudo pkg -i $1
                }
            ;;
        raspbian)
            pm() { sudo apt install -y $1
                }
            ;;
        endeavouros)
            pm() { sudo pacman -Sy --noconfirm $1
                }
            ;;
        freebsd)
            pm() { sudo pkg install -y $1
                }
            ;;
        *)
          echo -e "Sorry, but your System doesn't support [package manager] !
\e[92minstall: ffmpeg using your default package manager.\e[0m"
          # Add manualy to use package manager to start psfconsole !
            exit 0
            ;;
    esac

pm ffmpeg

cat <<- CONF > start.jellyfin
#!/bin/bash
JELLYFINDIR="${dir}"

\$JELLYFINDIR/jellyfin/jellyfin \
 -d \$JELLYFINDIR/data \
 -C \$JELLYFINDIR/cache \
 -c \$JELLYFINDIR/config \
 -l \$JELLYFINDIR/log \
 --ffmpeg ffmpeg
CONF

chmod +x start.jellyfin
sudo ln -s ${dir}/start.jellyfin /usr/bin/jellyfin

echo -e "\e[92mJellyfin successfully installed.\e[0m"
echo -e "\e[92mRun jellyfin server using: jellyfin\e[0m"
