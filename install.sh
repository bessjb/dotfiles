USER="jake"

apt update

apt install -y \
  flatpak \
  gnome-software-plugin-flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub md.obsidian.Obsidian \
  com.obsproject.Studio \
  io.neovim.nvim \
  org.videolan.VLC \
  com.bitwarden.desktop

REPO=${1:-'https://zotero.retorque.re/file/apt-package-archive'}
KEYNAME=zotero-archive-keyring.gpg
GPGKEY=https://raw.githubusercontent.com/retorquere/zotero-deb/master/$KEYNAME
KEYRING=/usr/share/keyrings/$KEYNAME

check_dir() {
    dir=$1
    if [ ! -d "$dir" ] || [ ! -w "$dir" ]; then
        echo "Directory does not exist or is not writable: $dir"
        exit 1
    fi
}


## Install docker from ppa
echo \
  "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu jammy stable"
  >> /etc/apt/sources.list.d/docker.list

## Install syncthing from ppa
echo \
  "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable"
  >> /etc/apt/sources.list.d/syncthing.list


## Install dropbox from ppa
echo \
  "deb [arch=i386,amd64] http://linux.dropbox.com/ubuntu disco main"
  >> /etc/apt/sources.list.d/dropbox.list

## Install Chrome from ppa
echo \
  "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main"
  >> /etc/apt/sources.list.d/google-chrome.list

## Install wireshark from ppa
echo \
  "deb-src https://ppa.launchpadcontent.net/wireshark-dev/stable/ubuntu/ jammy main"
  >> /etc/apt/sources.list.d/wireshark.list


## Install Qgis from ppa
#Types: deb deb-src
#URIs: https://qgis.org/debian
#Suites: jammy
#Architectures: amd64
#Components: main
#Signed-By: /etc/apt/keyrings/qgis-archive-keyring.gpg

# https://wiki.debian.org/DebianRepository/UseThirdParty

case `uname -m` in
  "i386" | "i686" | "x86_64")
    ;;
  *)
    echo "Zotero is only available for architectures i686 and x86_64"
    exit
    ;;
esac

check_dir /usr/share/keyrings
check_dir /etc/apt/sources.list.d

export GNUPGHOME="/dev/null"

sudo -E curl -L $GPGKEY -o $KEYRING

sudo chmod 644 $KEYRING

cat << EOF | sudo tee /etc/apt/sources.list.d/zotero.list
deb [signed-by=$KEYRING by-hash=force] $REPO ./
EOF

sudo apt-get clean
