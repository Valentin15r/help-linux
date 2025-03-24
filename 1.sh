#!/bin/sh

read -p "Установить DWM? (да/нет): " answer
if [ "$answer" != "да" ]; then
    echo "Установка отменена."
    exit 0
fi

echo "Обновление системы..."
sudo apk update

echo "Установка зависимостей..."
sudo apk add git xorg-server xinit dmenu

echo "Клонирование DWM..."
mkdir -p ~/suckless
git clone https://git.suckless.org/dwm ~/suckless/dwm

echo "Сборка и установка DWM..."
cd ~/suckless/dwm
make
sudo make install

echo "Создание .xinitrc..."
echo "exec dwm" > ~/.xinitrc

echo "Установка завершена! Вы можете запустить DWM с помощью команды 'startx'."
