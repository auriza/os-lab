---
title: Proses dan Job
author: Praktikum Sistem Operasi
institute: Ilmu Komputer IPB
date: 2017
theme: Dresden
header-includes:
    - \renewcommand{\figurename}{Gambar}
    - \renewcommand{\tablename}{Tabel}
---

# Proses

## `ps`
Menampilkan cuplikan informasi proses yang sedang berjalan.
```bash
ps [OPTION]
```
- `-e`: *every*; semua proses
- `-F`: *full*; format ekstra lengkap
- `-L`: LWP; tampilkan info *thread*
- `--forest`: format pohon proses

<!--
---

![Sintaks BSD vs POSIX](img/ps.png)
-->

## `pstree`
Menampilkan pohon proses.
```bash
pstree [OPTION] [PID,USER]
```
- `-n`: *numeric*; urutkan berdasarkan ID proses
- `-p`: PID; tampilkan ID proses


## `top`
Memonitor proses.
```bash
top [OPTION]
```
- `-u USER`: proses milik *USER* saja
- `-p PID`: proses *PID* saja

## `htop`
Memonitor proses secara interaktif.
```bash
htop [OPTION]
```
- `-u USER`: proses milik *USER* saja
- `-p PID`: proses *PID* saja

---

: Penjelasan kolom `htop`[^12-htop]

Kolom       Keterangan
-----       -----
`PID`       ID proses
`USER`      pemilik proses
`PR`, `NI`  prioritas, nilai *nice*
`VIRT`      ukuran memori virtual (keseluruhan proses)
`RES`       ukuran memori residen (fisik)
`SHR`       ukuran memori yang bisa di-*share*
`S`         status proses
            - `R`: *running*
            - `S`: *sleeping* (*idle*)
            - `D`: *disk waiting*
            - `T`: *stopped*

[^12-htop]: *lihat* '`man htop`'

## `pidof`
Mendapatkan PID dari program yang sedang berjalan.
```bash
pidof PROGRAM
```

## `kill`
Mengirim sinyal ke suatu proses (*default* `SIGTERM`).
```bash
kill [-SIGNAL] PID...
```

---

![Don't `SIGKILL`](img/dont-sigkill-l.png)


## `pmap`
Menampilkan *memory map* sebuah proses.
```bash
pmap PID
```

## `lsof`
Menampilkan daftar *file* yang sedang dibuka oleh proses.
```bash
lsof [-p PID]
```


## `nice`
Menjalankan program dengan nilai *nice*[^12-nice] tertentu (*default*: 10).
```bash
nice [-n NICE] COMMAND
```

[^12-nice]: nilai *nice* antara -20 (prioritas tinggi) sampai +19 (prioritas rendah)

## `renice`
Mengubah prioritas proses yang sudah berjalan.
```bash
renice [-n] NICE PID
```

## `time`
Menjalankan program dan meringkas penggunaan waktu CPU.
```bash
time COMMAND
```

---

![*User-space* vs *kernel-space*](img/userspace.png)

## `timeout`
Menjalankan program dengan batasan waktu tertentu.
```bash
timeout DURATION COMMAND
```

## `prlimit`
Mengatur batas penggunaan *resource* proses.
```bash
prlimit [OPTION] COMMAND
```
- `-t`: *time*; waktu CPU (detik)
- `-s`: *stack*; ukuran *stack* (byte)
- `-v`: *virtual memory*; ukuran memori (byte)
- `-n`: *number of open files*

---

![*Process information filesystem*](img/proc.png)


# Job

## Status Job

![Status *job*](img/linux-jobs-control.png)


## Proses Background

Untuk menjalankan proses di *background*, tambahkan tanda `&` pada akhir perintah.
```bash
COMMAND... &
```

## `jobs`
Menampilkan daftar *job* yang sedang aktif.
```bash
jobs
```

## `fg`
Memindahkan *job* ke *foreground*.
```bash
fg %JOB
```

## `bg`
Memindahkan *job* ke *background*.
```bash
bg %JOB
```

## `at`
Menjadwalkan *job* untuk dijalankan di masa depan.
```bash
at HH:MM [YYYY-MM-DD]
```
- `-l`: *list*; tampilkan daftar antrian *job*
- `-r`: *remove*; hapus *job* dari antrian


# Latihan UASP

---

```bash
# pindah ke direktori home anda
...
# buat satu folder kosong 'test'
...
# masuk ke direktori 'test'
...
# tampilkan path direktori saat ini
...
# buat file kosong bernama 'empty.txt'
...
```

---

```bash
# copy file '/etc/timezone' ke direktori ini
...
# ubah nama file 'timezone' menjadi 'tz'
...
# list isi direktori ini
...
# pindah ke direktori parent
...
# hapus direktori 'test' seisinya
...
```

---

```bash
# temukan file dengan nama 'fdisk' memakai `locate`
...
# temukan file dengan nama 'fdisk' memakai `find`
...
# temukan file pada home anda yang ukurannya > 200 MB
...
# temukan file pada home anda yang diubah < 3 hari
...
```

---

```bash
# tampilkan 5 baris pertama keluaran perintah `last`
...
# tampilkan dua baris terakhir file '/etc/passwd'
...
# cari file di '/usr/include' yang memuat kata 'sem_post'
...
# tampilkan kolom 1 dan 5 dari file '/etc/passwd'
...
# tampilkan isi file '/etc/motd' dalam huruf kapital
...
```

---

```bash
# jalankan `cat /dev/random > rand` di background
...
# tampilkan daftar job
...
# kirim sinyal STOP ke job tersebut
...
# lanjutkan job tersebut di background
...
# kirim sinyal TERM ke job tersebut
...
```

## Kisi-kisi

```
echo hostname uname date cal who
cd pwd ls touch
cp mv rm mkdir rmdir
chmod ln
locate find wc grep
cat head tail sort uniq cut tr sed
ps nice renice pidof kill
& jobs fg bg
```
