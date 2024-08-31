# Config
## Description
Config directory for ROS2 development in C++ and Python. IDE is neovim using clangd for code completion and cpptools for debugging. 

## Install
### Step 1

Install neovim v0.6.1
**Note** Ubuntu ships with older version - I used the flatpack with the latest release
https://github.com/neovim/neovim/releases

```
sudo apt install stow
```

### Step 2

clone this repo

```
git clone git@github.com:bessjb/config.git ~/.config
```
### Step 2
```
cd dotfiles
stow .
```


### Step 2

Install Packer                                                                                                                                                                                                                                                                                                                                                                     
[Github - Packer](https://github.com/wbthomason/packer.nvim)                                                                                                                                                                                                                                                                                                                       
                                                                                                                                                                                                                                                                                                                                                                                    
 ```                                                                                                                                                                                                                                                                                                                                                                                
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim                                                                                                                                                                                                                                                                                                                            
```

### Step 3

From inside nvim run the following commands

```
:PackerUpdate
```

Enjoy 

## Versions
Ubuntu version:
```
20.04
```
Neovim version:
```
NVIM v0.6.1
```
Tmux Version:` 
```
tmux 3.2a
```
Colcon version:
```
colcon-argcomplete 0.3.3: up-to-date
colcon-bash 0.4.2: up-to-date
colcon-cd 0.1.1: up-to-date
colcon-cmake 0.2.27: up-to-date
colcon-core 0.12.1: up-to-date
colcon-defaults 0.2.8: up-to-date
colcon-devtools 0.2.3: up-to-date
colcon-installed-package-information 0.1.0: up-to-date
colcon-library-path 0.2.1: up-to-date
colcon-metadata 0.2.5: up-to-date
colcon-notification 0.2.15: up-to-date
colcon-output 0.2.13: up-to-date
colcon-override-check 0.0.1: up-to-date
colcon-package-information 0.3.3: up-to-date
colcon-package-selection 0.2.10: up-to-date
colcon-parallel-executor 0.2.4: up-to-date
colcon-pkg-config 0.1.0: up-to-date
colcon-powershell 0.3.7: up-to-date
colcon-python-setup-py 0.2.8: up-to-date
colcon-recursive-crawl 0.2.1: up-to-date
colcon-ros 0.3.23: up-to-date
colcon-test-result 0.3.8: up-to-date
colcon-zsh 0.4.0: up-to-date

```
