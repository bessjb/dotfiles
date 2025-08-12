check_dir () {
		dir=$1
		if [ ! -d "$dir" ] || [ ! -w "$dir" ]; then
				echo "Directory does not exist or is not writable: $dir"
				exit 1
		fi
}

setup_source () {
	SOURCE="/etc/apt/sources.list.d/$1.list"
	KEYRING="/etc/apt/trusted.gpg.d/$1.gpg"
	GPGKEY_URL="$2"
	REPO="$3"
	ARGS=${@:4}

        echo "source: $SOURCE" 
        echo "keyring: $KEYRING" 
        echo "gpgkey: $GPGKEY_URL" 
	echo "args: $ARGS"
	
	wget -q -O - $GPGKEY_URL | gpg --dearmor | sudo tee $KEYRING > /dev/null
	if [ ${PIPESTATUS[1]} -ne 0 ]
	then
		echo "failed to dearmor - assuming key & attempting to create keyring"
		wget -q -O - $GPGKEY_URL | sudo apt-key --keyring $KEYRING add -
	fi

	sudo chmod 644 $KEYRING
	cat <<- EOF | sudo tee $SOURCE 
	deb [arch=amd64] $REPO $ARGS
	EOF
}

sudo add-apt-repository -y ppa:neovim-ppa/unstable

sudo apt update 

sudo apt upgrade -y

sudo apt install --fix-missing -y \
  git \
  git-lfs \
  htop \
  neovim \
  curl \
  tmux \
  jq \
  stow \
  npm \
  ripgrep \
  make \
  clang \
  biber \
  gparted \
  fzf \
  cargo \
  luarocks \
  python3-pip \
  python3.12-venv \
  qt6-base-dev \
  libxcb-cursor0

sudo npm install -g tree-sitter-cli

sudo ubuntu-drivers install

## TODO.. Add tectonic Automatically move to .local
#curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net |sh
## Biber = 2.17 also needs to be curl installed.. check checksums

## TODO
#Zotero in a better spot 
#Automatic install of zotero plugins
#Where are my zotero config files?

#mkdir -p ~/miniconda3
#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
#bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
#rm ~/miniconda3/miniconda.sh

echo "Creating sources for: "
echo "======================"
cat ./git_sources.csv | jq -r '.deb_ppa[] | .name + " " + .source_url + " " + .key_url + " " + .args' |
while read NAME SOURCE_URL KEY_URL ARGS
do
        echo "$NAME $KEY_URL $SOURCE_URL $ARGS"
        setup_source $NAME $KEY_URL $SOURCE_URL $ARGS
done
echo "======================"

sudo apt update
cat ./git_sources.csv | jq -r '.deb_ppa[] | .packages[]' | xargs sudo apt install -y
