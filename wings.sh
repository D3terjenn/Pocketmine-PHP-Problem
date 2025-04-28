#!/bin/bash

# meminta input nomor dari user
read -p "Masukkan nomor subdomain (contoh: 1 untuk sh-1.gemahost.cfd): " nomor

# cek kalau input kosong
if [[ -z "$nomor" ]]; then
  echo "Nomor tidak boleh kosong!"
  exit 1
fi

# hapus volumes
echo "Menghapus /var/lib/pterodactyl/volumes/ ..."
rm -rf /var/lib/pterodactyl/volumes/

# hapus config.yml
echo "Menghapus /etc/pterodactyl/config.yml ..."
rm -f /etc/pterodactyl/config.yml

# install python3-certbot-nginx
echo "Menginstall python3-certbot-nginx ..."
sudo apt update
sudo apt install python3-certbot-nginx -y

# jalankan certbot
echo "Menjalankan certbot untuk domain sh-$nomor.gemahost.cfd ..."
sudo certbot certonly --nginx -d sh-"$nomor".gemahost.cfd

echo "Selesai!"
