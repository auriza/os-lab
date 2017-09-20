---
title: Process and Job Control
author: Praktikum Sistem Operasi
institute: Ilmu Komputer IPB
date: 2017
theme: Dresden
header-includes:
    - \renewcommand{\figurename}{Gambar}
---

# Proses

## `ps`
Menampilkan cuplikan informasi proses yang sedang berjalan.
```bash
ps [OPTION]
```
- `-e`: (*every*) semua proses
- `-f`: (*full*) format lengkap
- `-L`: (*lightweight*) tampilkan informasi *thread*
- `--forest`: pohon proses


## `pstree`
Menampilkan pohon proses.
```bash
pstree [OPTION] [PID|USER]
```
- `-n`: (*numeric*) urutkan berdasarkan PID
- `-p`: (PID) tampilkan PID


## `top`
Memonitor proses.
```bash
top [OPTION]
```
- `-u USER`: proses milik `USER` tertentu saja
- `-p PID`: proses `PID` tertentu saja

## `htop`
Memonitor proses secara interaktif.
```bash
htop [OPTION]
```
- `-u USER`: proses milik `USER` tertentu saja
- `-p PID`: proses `PID` tertentu saja

## `pgrep`
Mendapatkan PID suatu proses berdasarkan namanya.
```bash
pgrep [OPTION] PATTERN
```
- `-u USER`: proses milik `USER` tertentu saja


## `kill`
Mengirim sinyal ke suatu proses (*default* `SIGTERM`).
```bash
kill [OPTION] PID
```
- `-SIG`: mengirim sinyal `SIG`
- `-l`: (*list*) menampilkan semua daftar sinyal

---

![Don't `SIGKILL`](img/dont-sigkill-l.png)


## `pmap`
Menampilkan *memory map* sebuah proses.
```bash
pmap [OPTION] PID ...
```
- `-x`: *extended format*


## `lsof`
Menampilkan daftar *file* yang sedang dibuka oleh proses.
```bash
lsof [OPTION] [FILENAME]
```
- `-p PID`: proses `PID` tertentu saja


## `nice`
Menjalankan program dengan prioritas (*niceness*)[^nice] tertentu.

```bash
nice [OPTION] COMMAND
```
- `-n NICE`: mengeset nilai `NICE`

[^nice]: nilai *niceness* antara -20 (prioritas tinggi) sampai 19 (prioritas rendah)

## `renice`
Mengubah prioritas proses yang sudah berjalan.
```bash
renice [OPTION] PID
```
- `-n NICE`: mengubah nilai `NICE`

---

![*Process information filesystem*](img/proc.png)


# Job Control

## Process State

![*Process state*](img/linux-jobs-control.png)


## Background Process

Untuk menjalankan proses di *background*, tambahkan tanda `&` pada akhir perintah.
```bash
COMMAND &
```

## `jobs`
Menampilkan daftar *job* yang sedang aktif.
```bash
jobs
```

## `fg`
Memindahkan *job* ke *foreground*.
```bash
fg [JOBSPEC]
```

## `bg`
Memindahkan *job* ke *background*.
```bash
bg [JOBSPEC]
```

<!-- TODO: at atq atrm nohup disown time ulimit timeout-->
