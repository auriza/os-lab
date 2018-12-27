---
title: Perintah Tambahan
author: Praktikum Sistem Operasi
institute: Ilmu Komputer IPB
date: 2018
theme: Dresden
header-includes:
    - \usepackage{fontspec}
    - \usepackage{polyglossia}
    - \setmainlanguage{english}
    - \setotherlanguage{arabic}
    - \newfontfamily\arabicfontsf[Script=Arabic]{Amiri}
---


# Kompresi File

## `tar`
Menggabung beberapa *file* ke dalam satu *file* arsip (**_t_**_ape_ **_ar_**_chive_).
```sh
tar [OPTION] [FILE...]
```
- `-c`: *create*; buat arsip baru
- `-x`: *extract*; ekstrak arsip
- `-f`: *file*; gunakan *file* berikut
- `-z`: *zip*; gunakan kompresi `gzip`
- `-C`: *chdir*; ekstrak ke direktori berikut

## `gzip`
Mengompres *file*.
```sh
gzip [FILE...]
```

## `gunzip`
Mengekstrak *file*.
```sh
gunzip [FILE...]
```

## `tar.gz`

![](img/tar.gz.png)\

\centering\tiny (sumber: <https://commons.wikimedia.org/wiki/File%3ATargzip.svg>)

\normalsize

```sh
# compress
tar -c FILE... | gzip > ARCHIVE.tar.gz

# extract
gunzip < ARCHIVE.tar.gz | tar -x
```

## `tar.gz`

![](img/tar.gz.png)\

\centering\tiny (sumber: <https://commons.wikimedia.org/wiki/File%3ATargzip.svg>)

\normalsize

```sh
# compress
tar -czf ARCHIVE.tar.gz FILE...

# extract
tar -xzf ARCHIVE.tar.gz
```


## `zip`
Membungkus dan mengkompresi *file*.
```sh
zip [OPTION] ARCHIVE FILE...
```
- `-e`: *encrypt*; kunci dengan *password*
- `-r`: *recursive*; direktori seisinya

## `unzip`
Mengekstrak *file* arsip ZIP.
```sh
unzip ARCHIVE [-d DIR]
```
- `-d`: *directory*; ekstrak ke direktori berikut


# Konversi File

## `convert`
Konversi citra: format, ukuran, efek, dan sebagainya.
```sh
convert INFILE [OPTION] OUTFILE
```
- `-blur      WIDTHxHEIGHT:` menyamarkan detail
- `-canny     WIDTHxHEIGHT:` deteksi tepi
- `-equalize              :` ekualisasi histogram
- `-negate                :` negatif
- `-normalize             :` normalisasi warna
- `-paint     RADIUS      :` efek lukisan minyak
- `-resize    WIDTHxHEIGHT:` mengubah ukuran

---

\small
\centering

```sh
convert rpi.jpg -canny 2x2 -negate rpi-edge.png

convert rpi.jpg -paint 5 rpi-paint.jpg
```

![](img/rpic.png){width=45%}
![](img/rpip.jpg){width=45%}\


## `ffmpeg`
Konversi audio dan video.
```sh
ffmpeg -i INFILE [OPTION] OUTFILE
```
- `-b`: *bitrate*
- `-c`: *codec*
- `-f`: *frame rate*
- `-s`: *frame size*
- `-ss`: *seek start*; waktu awal
- `-to`: waktu akhir


## `pandoc`
Konversi Markdown ke format lain (HTML, LaTeX, PDF).
```sh
pandoc [OPTION] [INFILE...] -o OUTFILE
```
- `-s`: *standalone*; dokumen HTML utuh
- `-t`: *to*; format keluaran

---

```sh
# HTML
pandoc file.md -o file.html -s

# PDF
pandoc file.md -o file.pdf

# HTML slide
pandoc slide.md -t slidy  -o slide.html -s

# PDF slide
pandoc slide.md -t beamer -o slide.pdf
```


## `tesseract`
Konversi citra ke teks (*optical character recognition*).
```sh
tesseract [OPTION] INFILE OUTFILE
```
- `-l`: *language*; gunakan bahasa berikut

---

\centering
![](img/shalat.jpg){width=30%}\

\tiny(<https://raw.githubusercontent.com/auriza/os-lab/master/img/shalat.jpg>)
\normalsize

```bash
tesseract shalat.jpg stdout
# Jagalah shalat wajib dan (terutama) shalat ‘Ashr
# quran. com/2/238

tesseract -l ara shalat.jpg stdout
```

\textarabic{حافظوا على الصلوات}

\textarabic{والصلاة الوسطى}

## `espeak`
Konversi teks ke suara (*speech synthesizer*).
```sh
espeak [OPTION] [WORDS]
```
- `-p`: *pitch*; ketebalan suara (0--99)
- `-s`: *speed*; kecepatan kata per menit
- `-v`: *voice*; jenis suara (`en`, `id`, `fr`, ...)

---

```bash
# default English voice
espeak "Hello world"

# Indonesian voice
espeak -v id "Institut Pertanian Bogor"

# create audiobook
man gittutorial | espeak --stdout | ffmpeg -i - git.mp3
```

## `dot`
Konversi teks ke graf.
```sh
dot [OPTION] [FILE]
```
- `-Tpng`: format keluaran PNG
- `-Tsvg`: format keluaran SVG

---

```sh
echo "digraph unix {
    node [shape=box]
    UNIX -> {SysV BSD}
    SysV -> {AIX HPUX Solaris}
    BSD  -> {FreeBSD MacOSX}
    UNIX -> Linux [style=dashed]
    {rank=same Linux MacOSX}
}" | dot -Tpng > unix.png
```

\begingroup\centering
![](img/unix.png){width=60%}\
\endgroup

---

![](img/mk2017.dot.png)\


# Info Sistem

## `lscpu`
Menampilkan informasi tentang arsitektur CPU.
```sh
lscpu
```

## `lshw`
Menampilkan informasi konfigurasi perangkat keras.
```sh
lshw [OPTION]
```
- `-short`: format pendek
- `-html`: format HTML

## `lspci`
Menampilkan informasi perangkat PCI.
```sh
lspci [OPTION]
```
- `-k`: *kernel*; nama *driver* kernel
- `-v`: *verbose*; info detail

## `lsusb`
Menampilkan informasi perangkat USB.
```sh
lsusb [OPTION]
```
- `-t`: *tree*; pohon hierarki
- `-v`: *verbose*; info detail


## `lsblk`
Menampilkan informasi perangkat blok.
```sh
lsblk [OPTION]
```
- `-m`: *mode*; pemilik dan mode *permission*
- `-t`: *topology*; topologi perangkat blok

## `lslocks`
Menampilkan daftar kunci yang sedang dipegang.
```sh
lslocks [OPTION]
```
- `-p`: PID; proses dengan PID berikut saja

## `lsof`
Menampilkan daftar *file* yang sedang dibuka.
```sh
lsof [OPTION] [FILENAME]
```
- `-p`: PID; proses dengan PID berikut saja
- `-u`: *user*; proses dari *user* berikut saja
- `-i`: Internet *socket*
- `-U`: UNIX *socket*

## `df`
Menampilkan sisa ruang disk.
```sh
df [OPTION]
```
- `-a`: *all*; semua *filesystem*
- `-h`: *human-readable*; format ukuran
- `-i`: *inode*; info inode
- `-T`: *type*; jenis *filesystem*

## `du`
Menampilkan penggunaan disk.
```sh
du [OPTION] [FILE]
```
- `-d`: *depth*; kedalaman direktori
- `-h`: *human-readable*; format ukuran
- `-s`: *summary*; total ukuran
- `--inodes`: info pemakaian *inode*

## `free`
Menampilkan besar memori yang kosong dan terpakai.
```sh
free [OPTION]
```
- `-h`: *human-readable*; format ukuran

## `vmstat`
Menampilkan statistik *virtual memory*.
```sh
vmstat [OPTION] [DELAY]
```
- `-d`: *disk*; statistik *disk*
- `-s`: *stat*; statistik memori
- `-w`: *wide*; mode tampilan lebar
- `-S M`: satuan dalam MiB

## `sensors`
Menampilkan info sensor.
```sh
sensors
```


# \textarabic{شكرا}
