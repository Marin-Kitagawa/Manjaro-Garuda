# Removing some files which will conflict later while adding Garuda configs
sudo mv /etc/lsb-release ~
sudo rm -rf /etc/bash.bashrc
sudo rm -rf /etc/skel/.bashrc


# Adding Chaotic AUR repository
su
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
cd /etc/
rm -rf ./pacman.d/mirrorlist
curl -sSf --proto '=https' --tlsv1.2 https://pastebin.com/raw/hrah2Tjm -o mirrorlist
rm -rf ./pacman.d/chaotic-mirrorlist
curl -sSf --proto '=https' --tlsv1.2 https://pastebin.com/raw/tHDNWKK1 -o chaotic-mirrorlist
rm -rf ./pacman.conf
curl -sSf --proto '=https' --tlsv1.2 https://pastebin.com/raw/0z6FwGfp -o pacman.conf
pacman -Syyu --noconfirm        # Updating the system
mv $HOME/lsb-release .
exit                            # Exiting from `root`

# Installing necessary tools

## Build tools
sudo pacman -Syu make cmake clango base-devel             # Install all of them in `base-devel`

# Neovim
sudo pacman -Syu neovim

# Rust
curl -sSf --proto '=https' --tlsv1.2 https://sh.rustup.rs | sh        # Choose `complete` installation instead of `default`

# LunarVim
## If you're using `fish`, comment line #32 and uncomment line #33
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)         # For `bash` shells
# bash (curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh | psub)   # For fish shells
## Install Rust and Python dependencies for LunarVim

# Installing neovide
