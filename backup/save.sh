#!/bin/bash

mkdir -p _keys/ssh
mkdir -p _keys/gnupg
mkdir -p _keys/tarsnap

cp ~/.ssh/* _keys/ssh/
cp ~/.gnupg/pubring.gpg _keys/gnupg/
cp ~/.gnupg/secring.gpg _keys/gnupg/
sudo cp /usr/local/etc/tarsnap.conf _keys/tarsnap/
sudo cp /root/tarsnap.key _keys/tarsnap/
sudo cp /root/tarsnap-backup.sh _keys/tarsnap/

gpg --export-ownertrust > _keys/gnupg/drift-ownertrust-gpg.txt

sudo tar czvf _keys.tar.gz _keys/
sudo gpg -a --symmetric --cipher-algo AES256 _keys.tar.gz
sudo rm _keys.tar.gz
sudo rm -rf _keys/
