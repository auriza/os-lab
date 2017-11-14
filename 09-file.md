---
title: File dan Direktori
author: Praktikum Sistem Operasi
institute: Ilmu Komputer IPB
date: 2017
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
Jika tanpa parameter, maka `cd` akan pindah ke direktori *home* pengguna (`~`).

## `ls`
Menampilkan list isi direktori.
```bash
ls [OPTION] [FILE]
```
- `-a`: *all*; tampilkan *dotfile*
- `-h`: *human-readable*; format ukuran mudah dibaca
- `-i`: *inode*; cetak nomor indeks
- `-l`: *long*; format panjang
- `-r`: *reverse*; balik urutan list
- `-S`: *size*; urutkan berdasarkan ukuran

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
- `-f`: *force*; tanpa konfirmasi jika terjadi *overwrite*
- `-i`: *interactive*; ada konfirmasi sebelum *overwrite*
- `-r`: *recursive*; salin direktori secara rekursif

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
- `-f`: *force*; tanpa konfirmasi dan abaikan *error*
- `-i`: *interactive*; meminta konfirmasi setiap kali menghapus
- `-r`: *recursive*; hapus direktori seisinya secara rekursif

## `rmdir`
Menghapus direktori kosong.
```bash
rmdir [OPTION] DIRECTORY...
```
- `-p`: *parent*; hapus beserta *parent*-nya
    - misal: '`rmdir -p a/b/c`' sama dengan '`rmdir a/b/c a/b a`'

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

- masuk ke direktori *home* anda
- buat direktori `public_html`
- masuk ke direktori tersebut
- unduh dengan `wget` templat resume berikut
    - <https://raw.githubusercontent.com/auriza/os-lab/master/txt/bio.html>
- ubah nama *file* menjadi `resume.html`
- edit *file* sesuai dengan data diri anda
- hasilnya bisa dilihat pada laman:
    - <http://os.apps.cs.ipb.ac.id/~$USER/resume.html>
