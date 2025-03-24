#!/bin/sh

read -p "Install DWM? (yes/no): " answer
if [ "$answer" != "yes" ]; then
    echo "Installation cancelled."
    exit 0
fi

echo "Updating the system..."
sudo apk update

echo "Installing dependencies..."
sudo apk add git xorg-server xinit dmenu

echo "Cloning DWM..."
mkdir -p ~/suckless
git clone https://git.suckless.org/dwm ~/suckless/dwm

echo "Building and installing DWM..."
cd ~/suckless/dwm
make
sudo make install

echo "Creating .xinitrc..."
echo "exec dwm" > ~/.xinitrc

echo "Installation completed! You can start DWM using the command 'startx'."
