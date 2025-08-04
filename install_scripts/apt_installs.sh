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
  fzf

sudo npm install -g tree-sitter-cli

sudo ubuntu-drivers install

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
