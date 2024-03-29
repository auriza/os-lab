---
title: File dan Direktori
author: Praktikum Sistem Operasi
institute: Ilmu Komputer IPB
date: 2022
theme: Dresden
---


# File dan Direktori

## `file`
Menentukan jenis *file*.
```bash
file FILE...
```

## `pwd`
Mencetak nama direktori saat ini.
```bash
pwd
```

## `cd`
Mengganti direktori (*default* ke direktori *home*).
```bash
cd [DIR]
```

## `ls`
Menampilkan daftar isi direktori.
```bash
ls [OPTION] [FILE]
```
- `-a`: *all*; tampilkan semua
- `-l`: *long*; format panjang
- `-h`: *human-readable*; format ukuran
- `-i`: *inode*; cetak nomor inode *file*

## `touch`
Meng-*update* waktu akses dan modifikasi suatu `FILE`.
Jika `FILE` belum ada, maka `touch` akan membuat `FILE` kosong.
```bash
touch FILE
```

## `mkdir`
Membuat direktori.
```bash
mkdir [OPTION] DIR
```
- `-p`: *parent*; buat direktori *parent* jika diperlukan

## `cp`
Menyalin *file* dan direktori.
```bash
cp [OPTION] SOURCE DEST
cp [OPTION] SOURCES... DIR
```
- `-r`: *recursive*; salin direktori seisinya
- `-f`: *force*; tanpa konfirmasi jika *overwrite*
- `-i`: *interactive*; konfirmasi sebelum *overwrite*

## `mv`
Memindahkan (mengganti nama)  *file*.
```bash
mv [OPTION] SOURCE DEST
mv [OPTION] SOURCES... DIR
```
- `-f`: *force*; tanpa konfirmasi jika *overwrite*
- `-i`: *interactive*; konfirmasi sebelum *overwrite*

## `rm`
Menghapus *file* atau direktori.
```bash
rm [OPTION] FILE...
```
- `-r`: *recursive*; hapus direktori seisinya
- `-f`: *force*; tanpa konfirmasi jika *error*
- `-i`: *interactive*; konfirmasi sebelum menghapus

## `rmdir`
Menghapus direktori kosong.
```bash
rmdir [OPTION] DIR...
```
- `-p`: *parent*; hapus beserta direktori *parent*-nya

## `tree`
Menampilkan isi direktori dalam format *tree*.
```bash
tree [OPTION] [DIR...]
```
- `-L N`: level kedalaman direktori
- `-h`: *human-readable*; format ukuran

## *Dotfile*

- *File* yang namanya diawali dengan titik
- *Dotfile* tidak akan terlihat (*hidden*)
- Biasa dipakai untuk nama *file* konfigurasi

## Simbol Direktori

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
ditulis lengkap dari direktori *root*; contoh: '`/etc`'

### *Relative*
ditulis relatif terhadap posisi saat ini; contoh: '`../etc`'

## Latihan

- [Launch School - Intro Command Line](https://launchschool.com/books/command_line/read/files_directories_executables#managingfiles)

# Tugas

## Tugas

- login ke server `172.18.14.15`
- buat direktori `public_html` di *home* anda
- buat *file* baru `index.html` di direktori tsb
- edit *file*, tuliskan NIM dan nama anda
- hasilnya bisa dilihat pada laman:
    - <http://172.18.14.15/~$USER>
    - <http://s1.apps.cs.ipb.ac.id/~$USER>
