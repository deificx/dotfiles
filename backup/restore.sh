#!/bin/bash

sudo gpg --output _keys.tar.gz --decrypt _keys.tar.gz.asc
sudo tar xzvf _keys.tar.gz

mkdir -p ~/.ssh
mkdir -p ~/.gnupg

cp _keys/ssh/* ~/.ssh
cp _keys/gnupg/*.gpg ~/.gnupg

sudo cp _keys/tarsnap/tarsnap.conf /usr/local/etc/
sudo cp _keys/tarsnap/tarsnap.key /root/
sudo cp _keys/tarsnap/tarsnap-backup.sh /root/

gpg --import-ownertrust _keys/gnupg/drift-ownertrust-gpg.txt

sudo rm _keys.tar.gz
sudo rm -rf _keys

## install tarsnap
# sudo apt install gcc libc6-dev make libssl-dev zlib1g-dev e2fslibs-dev
# wget https://www.tarsnap.com/download/tarsnap-autoconf-1.0.37.tgz
# tar -xzf tarsnap-autoconf-1.0.37.tgz
# cd tarsnap-autoconf-1.0.37/
# ./configure
# make all
# sudo make install

## configure tarsnap
# sudo tarsnap-keygen --keyfile /root/tarsnap.key --user even@alander.org --machine work
