# create backup

- run save.sh
- enter pass phrase for gpg encryption

# tarsnap

Backups are done with root user using tarsnap from the / (top level) directory.

Steps to restore a backup:

- sudo su
- cd /
- tarsnap --list-archives
- tarsnap -x -v -f archive-name
