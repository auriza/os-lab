## TIMEZONE

raspi-config --> timezone


## CHANGE PASSWORD

passwd


## STATIC IP

cat << EOF >> /etc/dhcpcd.conf

interface eth0
static ip_address=172.18.12.12/24
static routers=172.18.12.254
static domain_name_servers=172.17.5.14 172.17.5.21
EOF
sudo reboot


## APPS

curl http://1.1.1.3/ac_portal/login.php -d "opr=pwdLogin&userName=___&pwd=___"
sudo apt update
sudo apt upgrade
sudo apt install htop tree w3m git
sudo apt install mailutils


## APACHE

sudo apt install apache2
sudo a2enmod userdir
sudo editor /etc/apache2/mods-enabled/php7.0.conf   # enable PHP engine in userdir
sudo systemctl restart apache2


## SHELL IN A BOX

sudo apt install shellinabox
sudo editor /etc/default/shellinabox
#SHELLINABOX_ARGS="--no-beep --disable-ssl"


## ENERGY SAVING

vcgencmd display_power 0                            # HDMI power off
echo none | sudo tee /sys/class/leds/led0/trigger   # ACT LED off

sudo editor /boot/config.txt                        # Disable WiFi and BT
### dtoverlay=pi3-disable-bt
### dtoverlay=pi3-disable-wifi
sudo systemctl disable hciuart


## MONITORING

vcgencmd measure_temp
vcgencmd measure_clock {arm,core}
vcgencmd measure_volts {core,sdram_c,sdram_i,sdram_p}
vcgencmd get_mem {arm,gpu}
vcgencmd get_lcd_info


## HUGO

sudo apt install gdebi-core
wget 'https://github.com/gohugoio/hugo/releases/download/v0.30.2/hugo_0.30.2_Linux-ARM.deb'
sudo gdebi 'hugo_0.30.2_Linux-ARM.deb'

<< EOF
---
title: "Hugo Start"
date: 2017-11-14T15:50:20+07:00
draft: false
---

Hugo adalah generator situs web statik.
Halaman ditulis menggunakan Markdown.

# Inisialisasi Situs Baru

```sh
hugo new site 'blog'
cd blog
git init
git submodule add 'https://github.com/budparr/gohugo-theme-ananke.git' themes/ananke
echo 'theme = "ananke"' >> config.toml
```

# Link Akses Publik

```sh
ln -s ~/blog/public/ ~/public_html/blog
```

# Tulis Post Baru

```sh
hugo new posts/my-first-post.md
editor content/posts/my-first-post.md
```

Pastikan *header* dokumen `draft: true` diset menjadi `false` agar terpublikasi.

# Generate Situs Statik

```sh
hugo -b http://os.apps.cs.ipb.ac.id/~$USER/blog
```

Buka laman di atas untuk melihat situs baru anda.

Setiap kali menambahkan atau mengubah isi post, jalankan perintah `hugo` di
atas untuk meng-generate perubahan isi situs.
EOF
