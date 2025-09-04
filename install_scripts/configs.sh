
rm ~/.bashrc

pushd ~/dotfiles
stow .
popd

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
## TODO.. Do this better
xhost +local:docker

CRON_JOB="0 2 * * * rm -rf $USER/Downloads/*"
( crontab -l 2>/dev/null | grep -Fv "$CRON_JOB" ; echo "$CRON_JOB" ) | crontab -

profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1}
gsettings set \
  "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" \
  audible-bell false

gsettings set \
  "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" \
  background-color 'rgb(0,0,0)'

gsettings set \
  "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" \
  foreground-color 'rgb(228,228,228)'

gsettings set \
  "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" \
  use-theme-colors false

gsettings set org.gnome.shell favorite-apps "[ \
  'ubuntu-desktop-bootstrap_ubuntu-desktop-bootstrap.desktop', \
  'org.gnome.Nautilus.desktop', \
  'google-chrome.desktop','org.gnome.Terminal.desktop', \
  'obsidian_obsidian.desktop', \
  'zotero.desktop', \
  'bitwarden_bitwarden.desktop' \
  ]"

xdg-mime default nvim.desktop text

## TODO -- add default apps here

dropbox start --install

