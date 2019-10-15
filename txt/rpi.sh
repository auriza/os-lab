## INIT SETUP
sudo raspi-config --> passwd, locale:en_US, timezone, enable ssh
#crontab -e
### 0 13 * * * * curl http://1.1.1.3/ac_portal/login.php -sd 'opr=pwdLogin&userName=komdat&pwd=kom312ipbb'

## STATIC IP
cat << ! >> /etc/dhcpcd.conf

interface eth0
static ip_address=172.18.12.12/24
static routers=172.18.12.254
static domain_name_servers=172.17.5.14
!
sudo reboot

## APPS
sudo apt update
sudo apt upgrade
sudo apt install mailutils
sudo apt install tree w3m git bmon
sudo apt install imagemagick libav-tools pandoc tesseract-ocr-ara espeak graphviz figlet

## APACHE
sudo apt install apache2
sudo a2enmod userdir
sudo systemctl restart apache2

## SHELL IN A BOX
sudo apt install shellinabox
sudo editor /etc/default/shellinabox
<<!
SHELLINABOX_ARGS="--no-beep --disable-ssl"
!

## ENERGY SAVING
sudo editor /boot/config.txt                        # Disable WiFi and BT
<<!
dtoverlay=pi3-disable-bt
dtoverlay=pi3-disable-wifi
!
sudo systemctl disable hciuart
vcgencmd display_power 0                            # HDMI power off
#echo none | sudo tee /sys/class/leds/led0/trigger  # ACT LED off

## MONITORING
vcgencmd measure_temp
vcgencmd measure_clock {arm,core}
vcgencmd measure_volts {core,sdram_c,sdram_i,sdram_p}
vcgencmd get_mem {arm,gpu}
vcgencmd get_lcd_info

## MICRO
wget 'https://github.com/zyedidia/micro/releases/download/v1.3.3/micro-1.3.3-linux-arm.tar.gz'
tar -xzf micro-1.3.3-linux-arm.tar.gz
sudo cp micro*/micro /usr/local/bin
rm -r micro*

## HUGO

sudo apt install gdebi-core
wget 'https://github.com/gohugoio/hugo/releases/download/v0.30.2/hugo_0.30.2_Linux-ARM.deb'
sudo gdebi 'hugo_0.30.2_Linux-ARM.deb'
<<EOF
---
title: "Hugo Start"
date: 2017-11-14T15:50:20+07:00
draft: false
---

Hugo adalah generator situs web statik.
Halaman ditulis menggunakan Markdown.

# Inisialisasi Situs Baru

```sh
hugo new site blog
cd blog
git init
git submodule add https://github.com/MunifTanjim/minimo themes/minimo
cp themes/minimo/exampleSite/config.toml .
```

# Link Akses Publik

```sh
ln -s public ~/public_html/blog
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
