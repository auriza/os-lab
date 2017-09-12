---
title: File dan Direktori
author: Praktikum Sistem Operasi
institute: Ilmu Komputer IPB
date: 2016
theme: Dresden
---


# File dan Direktori

## `pwd`
Mencetak nama direktori saat ini.
```bash
pwd
```

## `cd`
Mengganti direktori.
```bash
cd [DIRECTORY]
```
Jika tanpa parameter `DIRECTORY`, maka `cd` akan mengganti ke directori *home* (`~`).

## `ls`
Menampilkan daftar isi direktori.
```bash
ls [OPTION] [FILE]
```
- `-a`: tampilkan juga *dotfile*
- `-h`: mencetak ukuran dalam format yang mudah dibaca
- `-i`: cetak nomor indeks setiap *file*
- `-l`: gunakan format panjang
- `-r`: balik urutan *sorting*
- `-S`: *sorting* berdasarkan ukuran

## `touch`
Meng-*update* waktu akses dan modifikasi suatu `FILE`.
```bash
touch FILE
```
Jika `FILE` belum ada, maka `touch` akan membuat `FILE` kosong.

## `mkdir`
Membuat direktori.
```bash
mkdir [OPTION] DIRECTORY
```
- `-p`: buar direktori *parent* jika diperlukan

## `cp`
Menyalin *file* dan direktori.
```bash
cp [OPTION] SOURCE DEST
cp [OPTION] SOURCES... DIRECTORY
```
- `-f`: tanpa konfirmasi jika terjadi *overwrite*
- `-i`: meminta konfirmasi sebelum *overwrite*
- `-r`: salin direktori secara rekursif

## `mv`
Memindahkan (mengganti nama)  *file*.
```bash
mv [OPTION] SOURCE DEST
mv [OPTION] SOURCES... DIRECTORY
```
- `-f`: tanpa konfirmasi jika terjadi *overwrite*
- `-i`: meminta konfirmasi sebelum *overwrite*

## `rm`
Menghapus *file* atau direktori.
```bash
rm [OPTION] FILE...
```
- `-f`: tanpa konfirmasi, abaikan jika *file* tidak ada
- `-i`: meminta konfirmasi setiap kali menghapus
- `-r`: hapus direktori dan isinya secara rekursif

## `rmdir`
Menghapus direktori kosong.
```bash
rmdir [OPTION] DIRECTORY...
```
- `-p`: hapus `DIRECTORY` dan pendahulunya; misal: '`rmdir -p a/b/c`' sama dengan '`rmdir a/b/c a/b a`'

## *Dotfile*
*File* yang namanya diawali dengan tanda titik. Secara umum, *dotfile* tidak akan terlihat (*hidden*). Biasanya digunakan untuk menyimpan konfigurasi program.

## Simbol

### `~`
direktori *home* pengguna (`/home/$USER/`)

### `.`
direktori saat ini

###  `..`
direktori *parent* dari direktori saat ini

### `/`
direktori *root*, yaitu direktori paling atas

## *Path*

###  *Absolute*
*path* ditulis lengkap dari direktori *root*; contoh: '`/etc`'

### *Relative*
*path* ditulis relatif terhadap posisi saat ini; contoh: '`../etc`'

## Tugas

- masuk ke direktori *home* anda
- buat direktori `public_html`
- masuk ke direktori tersebut
- unduh templat resume di "<https://git.io/v92wK>" ke sini
- ubah nama *file* menjadi `resume.html`
- edit *file* sesuai dengan data anda
- untuk melihat tampilannya, buka halaman web "<http://172.20.35.100/~$USER/resume.html>"

<!-- - salin *file* `/home/auriza/public_html/bio.html` ke sini
- untuk melihat hasilnya, buka halaman web <http://os.apps.cs.ipb.ac.id/~$USER/bio.html> -->
