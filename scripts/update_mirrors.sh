cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --latest 200 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist
