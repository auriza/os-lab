---
title: UNIX Shell
author: Praktikum Sistem Operasi
institute: Ilmu Komputer IPB
date: 2019
theme: Dresden
---

# Shell

## Cara Kerja Shell

1. Baca masukan perintah dari pengguna
2. Pisahkan perintah per argumen (per kata)
3. Buat proses *child* (`fork`)
4. Jalankan perintah (`exec`)
5. Tunggu sampai *child* selesai (`wait`)
6. Kembali ke nomor 1

## Membuat Proses Baru

![](img/fork.png)\


# Tugas

## UNIX Shell

- Lihat **Project 1**[^04-shell], kerjakan **Part I**, yaitu membuat *shell*
    - templat program: <https://git.io/vycRv>
- Kumpulkan di LMS dengan nama *file* `[NIM].c`

[^04-shell]: Silberschatz *et al.* (2013), *Operating System Concepts*, hlm 157--159

<!--
- Tugas kelompok 4 orang
- Presentasi pekan depan
    - penjelasan kode program
    - demo uji coba program
-->

## Testcase

```
ps
dat
date
ps
uname -v
cd /
pwd
ls
exit
```

## Penilaian

Nilai akan dikurangi jika:

- ada zombie process
- parameter perintah tidak berfungsi
- tidak ada fitur `cd`
- tidak ada fitur `exit`

<!--

## UNIX Shell: Fitur History (Bonus)

- Lanjutkan **Part II**, yaitu membuat fitur *history*
    - **opsional**, bonus nilai
    - plagiasi akan mendapat sanksi nilai $-100$
- Kumpulkan di LMS dengan nama *file* `[NIM].c`
    - paling lambat besok pukul 22:00
-->
