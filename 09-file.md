---
title: File dan Direktori
author: Praktikum Sistem Operasi
institute: Ilmu Komputer IPB
date: 2017
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
Mengganti direktori.
```bash
cd [DIRECTORY]
```
Jika tanpa parameter, *default*-nya ke direktori *home* pengguna (`~`).

## `ls`
Menampilkan list isi direktori.
```bash
ls [OPTION] [FILE]
```
- `-a`: *all*; tampilkan semua
- `-l`: *long*; format panjang
- `-h`: *human-readable*; format ukuran
- `-i`: *inode*; cetak nomor inode *file*

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
- `-p`: *parent*; buat direktori *parent* jika diperlukan

## `cp`
Menyalin *file* dan direktori.
```bash
cp [OPTION] SOURCE DEST
cp [OPTION] SOURCES... DIRECTORY
```
- `-r`: *recursive*; salin direktori seisinya secara rekursif
- `-f`: *force*; tanpa konfirmasi jika terjadi *overwrite*
- `-i`: *interactive*; ada konfirmasi sebelum *overwrite*

## `mv`
Memindahkan (mengganti nama)  *file*.
```bash
mv [OPTION] SOURCE DEST
mv [OPTION] SOURCES... DIRECTORY
```
- `-f`: *force*; tanpa konfirmasi jika terjadi *overwrite*
- `-i`: *interactive*; ada konfirmasi sebelum *overwrite*

## `rm`
Menghapus *file* atau direktori.
```bash
rm [OPTION] FILE...
```
- `-r`: *recursive*; hapus direktori seisinya secara rekursif
- `-f`: *force*; tanpa konfirmasi dan abaikan *error*
- `-i`: *interactive*; meminta konfirmasi setiap kali menghapus

## `rmdir`
Menghapus direktori kosong.
```bash
rmdir [OPTION] DIRECTORY...
```
- `-p`: *parent*; hapus beserta *parent*-nya
    - misal: '`rmdir -p a/b/c`' sama dengan '`rmdir a/b/c a/b a`'

## `tree`
Menampilkan isi direktori dalam format *tree*.
```bash
tree [OPTION] [DIRECTORY...]
```
- `-L N`: level kedalaman direktori
- `-h`: *human-readable*; format ukuran

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
ditulis lengkap dari direktori *root*; contoh: '`/etc`'

### *Relative*
ditulis relatif terhadap posisi saat ini; contoh: '`../etc`'

## Tugas

- Buat direktori publik
    - masuk ke direktori *home* anda
    - buat direktori `public_html`
- Unduh templat
    - masuk ke direktori tersebut
    - unduh dengan '`wget`' templat resume berikut:
        - <https://raw.githubusercontent.com/auriza/os-lab/master/txt/bio.html>
    - ubah nama *file* menjadi `resume.html`
- Edit dan keluaran
    - edit *file* dengan '`editor`' sesuai dengan data diri anda
    - hasilnya bisa dilihat pada laman:
        - <http://os.apps.cs.ipb.ac.id/~$USER/resume.html>
