# Obsidian
curl -L --output /tmp/install/obsidian_1.9.12_amd64.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v1.9.12/obsidian_1.9.12_amd64.deb
sudo dpkg -i /tmp/install/obsidian_1.9.12_amd64.deb

# Bitwarden
curl -L --output /tmp/installs/Bitwarden-2025.8.2-amd64.deb "https://bitwarden.com/download/?app=desktop&platform=linux&variant=deb"
sudo dpkg -i /tmp/install/Bitwarden-2025.8.2-amd64.deb

# Draw.io??
curl -L --output /tmp/install/drawio-amd64-28.1.2.deb https://github.com/jgraph/drawio-desktop/releases/download/v28.1.2/drawio-amd64-28.1.2.deb
sudo dpkg -i /tmp/install/drawio-amd64-28.1.2.deb

# Zotero
mkdir /tmp/installs
curl -L --output /tmp/installs/Zotero_linux-x86_64 "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64"
tar -xjf /tmp/installs/Zotero_linux-x86_64 -C /tmp/installs
cp Zotero_linux-x86_64 /opt/Zotero
# * Automatic install of zotero plugins
# * May need to update vim configs

# Conda?
# mkdir -p ~/miniconda3
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
# bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
# rm ~/miniconda3/miniconda.sh

# Tectonic 
curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net |sh

# Biber
curl -L --output /tmp/installs/biblatex-biber-2.17 https://sourceforge.net/projects/biblatex-biber/files/biblatex-biber/2.17/biblatex-biber.tar.gz/download
tar -xzf /tmp/installs/biblatex-biber-2.17 -C /tmp/installs
cp /tmp/installs/biblatex-biber-2.17/bin/biber /home/$USER/.local/bin/

# yq
curl -L --output /tmp/installs/yq_linux_amd64.tar.gz https://github.com/mikefarah/yq/releases/download/v4.47.2/yq_linux_amd64.tar.gz
tar -xzf /tmp/installs/yq_linux_amd64.tar.gz -C /tmp/installs
cp /tmp/installs/yq_linux_amd64 /home/$USER/.local/bin

# Neovim

