---
title: UNIX Command Line
author: Praktikum Sistem Operasi
institute: Ilmu Komputer IPB
date: 2019
theme: Dresden
header-includes:
    - \renewcommand{\figurename}{Gambar}
---

# Pendahuluan

## Mengapa Belajar CLI?

- administrasi server UNIX
- perintah standar POSIX
- antarmuka berbasis teks
- otomatisasi dengan *shell script*

---

![Keluarga UNIX (sumber: Wikipedia)](img/unix-timeline.png)

## Server SO

- Alamat: <http://so.apps.cs.ipb.ac.id/sh>
    - *login*: lihat LMS

<!--
- Raspberry Pi 3 Model B[^08-rpi3]
    - 1.2 GHz quad-core ARMv8 CPU
    - 1 GiB RAM
- Raspbian GNU/Linux
- Alamat: `172.18.19.185`
    - *login*: lihat LMS

[^08-rpi3]: <https://www.raspberrypi.org/products/raspberry-pi-3-model-b/>

---

![Raspberry Pi](img/rpi2-server.jpg){width=80%}


## Login Server

- Alamat: `so.apps.cs.ipb.ac.id/sh`
- *Login*: lihat LMS
    - pola: `^[a-z][-a-z0-9_]{0,7}`
- *Password*: 6 digit terakhir NIM

![Model komputasi terpusat](img/terminals.jpg){width=50%}
-->

# Perintah Dasar

## `ssh`
Login ke komputer *remote*.
```bash
ssh [OPTION] USER@HOST
```
- `-X`: *X forwarding* untuk aplikasi GUI

## `echo`
Menampilkan satu baris teks.
```bash
echo [OPTION] [STRING]
```
- `-n`: tanpa *newline* di akhir

## `hostname`
Menampilkan nama *host* sistem.
```bash
hostname [OPTION]
```
- `-I`: tampilkan alamat IP

## `uname`
Menampilkan informasi kernel sistem.
```bash
uname [OPTION]
```
- `-a`: *all*; semua info

## `uptime`
Menampilkan berapa lama sistem sudah berjalan.
```bash
uptime
```

## `date`
Mencetak tanggal dan waktu sistem.
```bash
date [+FORMAT]
```

## `cal`
Menampilkan kalender.
```bash
cal [[MONTH] YEAR]
```

# Akun

## `whoami`
Menampilkan nama *user* efektif.
```bash
whoami
```

## `who`
Menampilkan siapa yang sedang login.
```bash
who [OPTION]
```
- `-q`: *quantity*; jumlah *user* yang sedang login
- `-w`: *write status* untuk pesan (`+`, `-`, `?`)

## `w`
Menampilkan siapa yang sedang login dan apa yang dijalankannya.
```bash
w [USER]
```

## `last`
Menampilkan daftar waktu *user* terakhir kali *login*.
```bash
last
```

## `passwd`
Mengganti *password* login.
```bash
passwd
```

## `logout`
Keluar dari sistem.
```bash
logout
```

# Komunikasi

## `write`
Mengirim pesan ke *user* lain yang sedang login.
```bash
write USER [TTY]
```

<!--
## `wall`
Mengirim pesan *broadcast* ke semua *user* lain yang sedang *login*.
```bash
wall [MESSAGE]
```
-->

## `mesg`
Mengontrol akses masuk pesan ke terminal anda (ya/tidak).
```bash
mesg [y|n]
```

<!--
## `talk`
Berbicata dengan *user* lain yang sedang *login*.
```bash
talk USER@HOST [TTY]
```
-->

## `mail`
Membaca atau mengirim email ke *user* lain.
```bash
mail [USER...]
```

---

:::::: {.columns}
::: {.column width="33%"}

### send mail

\scriptsize

```
pi@raspi:~ $ mail user
Cc:
Subject: Test
Hello world!
[Ctrl+D]
```

:::
::: {.column width="67%"}

### print, reply, delete mail

\scriptsize

```
user@raspi:~ $ mail
"/var/mail/user": 1 message 1 new
>N   1 pi@raspi   Tue Nov  6 14:54  15/422   Test

? print 1
Subject: Test
From: pi@raspi

Hello world!

? reply 1
Hello too.
[Ctrl+D]

? delete 1

? quit
```

:::
::::::

# Lain-Lain

## `poweroff`
Mematikan (*shutdown*) sistem.
```bash
sudo poweroff
```

## `reboot`
Me-*restart* sistem.
```bash
sudo reboot
```

## *Shortcut*

### `Tab`
*auto-completion*

### `Up`, `Down`
mengakses riwayat perintah

### `Ctrl+D`
mengakhiri teks (EOF)

### `Ctrl+C`
mengakhiri proses

### `Ctrl+L`
membersihkan layar

### `Ctrl+W`
menghapus satu kata ke belakang


## Sumber Tambahan

- UNIX commands list[^08-cmd]
- Explain Shell[^08-esh]
- CommandLineFu[^08-cfu]

[^08-cmd]: <https://en.wikipedia.org/wiki/Template:Unix_commands>
[^08-esh]: <http://explainshell.com>
[^08-cfu]: <https://www.commandlinefu.com>

# Tugas

## Email

Kirim surat ke *user* `auriza`.

<!-- TODO: add user mgmt: adduser, deluser, addgroup, etc. -->
