USER="jake"

apt update

apt install -y \
  curl \
  python-software-properties \
  software-properties-common \ 
  python-dev \
  python-pip \
  python3-dev \
  python3-pip

add-apt-repository ppa:neovim-ppa/stable
apt update
apt install neovim

pushd "/home/$USER"
mkdir build
push ./build
curl https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.7/obsidian_1.7.7_amd64.deb -o obsidian.deb
apt install "./obsidian.deb"
popd
