---
title: Permission, Link, dan Stream
author: Praktikum Sistem Operasi
institute: Ilmu Komputer IPB
date: 2019
theme: Dresden
header-includes:
    - \renewcommand{\figurename}{Gambar}
---


# Permission


## *Ownership*

- Tiap *file* memiliki *owner*
    - hanya *superuser* yang dapat mengubah kepemilikan *file*
- Tiap *file* memiliki *permission*
    - mengatur hak akses *file* tersebut

##  *Permission*

- Tiga jenis *user*:
    - `u`: *user owner*
    - `g`: *group owner*
    - `o`: *others*

- Tiga jenis *permission*:

|*Permission* | *File*    | *Directory*           |
|------------ | --------- | --------------------- |
|`r`          | *read*    | *list files*          |
|`w`          | *write*   | *add or remove files* |
|`x`          | *execute* | *enter the directory* |

<!--

## `su`
Berubah menjadi *user* lain atau menjadi *superuser*.
```bash
su [OPTION] [USERNAME]
```
- `-c CMD`: *command*; jalankan perintah `CMD`
- `-l`: *login*; set *environment* seperti jika login langsung

-->

## `chown`
Mengubah kepemilikan suatu *file*.
```bash
chown [OPTION] OWNER[:GROUP] FILE
```
- `-R`: *recursive*; ubah direktori seisinya

## `chmod`
Mengubah mode *permission* suatu *file*.
```bash
chmod [OPTION] MODE FILE...
```
- `-R`: *recursive*; ubah direktori seisinya

## Format `chmod`

- Format mode simbolis:
    - `[ugoa][+-=][rwx]`
- Format mode oktal:
    - 4 (*read*) + 2 (*write*) + 1 (*exec*)

## Contoh `chmod`

- `r--r--r--`
    - `chmod 444 FILE`
    - `chmod a=r FILE`
- `rw-rw----`
    - `chmod 660 FILE`
    - `chmod ug=rw,o= FILE`
- `rwxr-xr-x`
    - `chmod 755 FILE`
    - `chmod u=rwx,go=rx FILE`

---

![UNIX permissions](img/permissions.png)

---

![`chown` dan `chmod`](img/chown-chmod.png)

## Latihan

- Launch School - Intro Command Line

    <https://launchschool.com/books/command_line/read/permissions#exercises>


# *Link*

## *Hard Link* vs *SymLink*

1. *Hard link*
    - mengacu ke nomor indeks *file* (inode)
    - perubahan nama *file* tidak berpengaruh
    - hanya bisa dalam satu partisi
2. *Symbolic link*
    - mengacu ke nama *file*
    - perubahan nama *file* menyebabkan *broken link*
    - bisa lintas partisi dan *link* ke direktori

## `ln`
Membuat *link* antar-*file*.
```bash
ln [OPTION] TARGET LINK-NAME
```
- `-s`: *symbolic*; buat *symlink*

---

![Inode](img/inodes.png)

---

![Direktori dan symlink](img/directories.png)


# Stream

## *Stream* Standar

Setiap proses memiliki tiga *stream* standar I/O:

0. *standard input* (`stdin`)
1. *standard output* (`stdout`)
2. *standard error* (`stderr`)

```
            +------------+
            |            |
stdin  ---> |   PROSES   | --->  stdout
            |            |
            +-----+------+
                  |
                  \--->  stderr
```

## *Pipe*

- Menyalurkan *output* proses menjadi *input* proses selanjutnya
- Berguna untuk membuat *pipeline* perintah

```
                     pipe
+------------+         +        +------------+
|            |         |        |            |
|  PROCESS1  +---------|------->|  PROCESS2  |
|            | stdout  |  stdin |            |
+------------+         +        +------------+
```

- Contoh:
    - `echo "halo" | rev`
    - `echo "2 + 5" | bc`
    - `who | wc -l`

## *Redirect*

- Mengarahkan *stream* standar proses ke suatu *file* yang ditentukan oleh pengguna

|Karakter | *Redirect* |
|-------- | ---------- |
|`<`      | `stdin`    |
|`>`      | `stdout`   |
|`>>`     | `stdout` (*append*) |
|`2>`     | `stderr`   |

- Contoh:

    ```bash
    date > now.txt 2> err.txt
    rev < now.txt
    rev < now.txt > rev.txt
    ```

---

![File descriptor](img/file-descriptors.png)

---

![Pipe](img/pipes.png)

<!--

## Tugas Bonus

Buatlah sebuah blog dengan menggunakan '`hugo`'.

Panduannya lihat di:

- <http://os.apps.cs.ipb.ac.id/~auriza/blog/posts/hugo-start/>

-->
