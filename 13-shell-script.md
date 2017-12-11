---
title: Shell Scripting
author: Praktikum Sistem Operasi
institute: Ilmu Komputer IPB
date: 2017
theme: Dresden
---

## *Shell Scripting*
- menyimpan perintah *shell* ke dalam suatu *file*
- fitur pemrograman: variabel, kontrol aliran, fungsi
- berguna untuk:
    - pemrosesan teks
    - otomatisasi administrasi sistem


## Contoh
```
$ cat > hello
#!/bin/sh
echo "Hello world"
exit 0
^D

$ chmod +x hello

$ ./hello
Hello world
```

## Referensi

- `man sh`{.sh}
- <http://wiki.bash-hackers.org>
- <http://www.commandlinefu.com>

# Ekspansi

## *Pathname Expansion*

- `*`{.sh}: nol atau lebih karakter apapun
- `?`{.sh}: tepat satu karakter apapun
- `[...]`{.sh}: tepat satu karakter di dalam *range*
- `[!...]`{.sh}: tepat satu karakter selain dalam *range*

## *Pathname Expansion*

```sh
ls /bin/e*
  # /bin/echo  /bin/ed  /bin/egrep

ls /bin/e?
  # /bin/ed

ls /bin/[cde]?
  # /bin/cp  /bin/dd  /bin/df  /bin/ed

ls /bin/[!a-n]?
  # /bin/ps  /bin/rm  /bin/sh  /bin/ss  /bin/su
```

<!--
## *Brace Expansion*

```sh
echo b{a,i,u,e,o}t
  # bat bit but bet bot

echo {0..9}
  # 0 1 2 3 4 5 6 7 8 9

echo {0..9..2}
  # 0 2 4 6 8
```
-->

## *Parameter Expansion*

```sh
web="cs.ipb.ac.id"

echo $web
  # cs.ipb.ac.id

echo ${#web}
  # 12

echo ${web%.ac.id}
  # cs.ipb

echo ${web#cs.}
  # ipb.ac.id
```

## *Command Substitution*

```sh
$(...)
```

Menjalankan perintah dan mengembalikan keluarannya.

```sh

echo "I am $(whoami)."
  # I am root.

echo "Today is $(date +%A)."
  # Today is Tuesday.
```

## *Arithmetic Expansion*

```sh
$((...))
```

Mengevaluasi ekspresi aritmatika dan mengembalikan keluarannya.

```sh

x=5
y=3

echo $((x + y)) $((x * y)) $((x / y)) $((x % y))
  # 8 15 1 2

echo $((x > y)) $((x == y)) $((x > y && y > 0))
  # 1 0 1
```

## Parameter Khusus

- `$@`{.sh}: semua parameter
    - `$0`{.sh}: nama program
    - `$1`{.sh}: parameter pertama
    - `$2`{.sh}: parameter kedua
    - ...
- `$#`{.sh}: jumlah semua parameter
- `$?`{.sh}: status keluaran perintah terakhir
- `$!`{.sh}: PID proses *background* terakhir
- `$$`{.sh}: PID proses *shell*


## `[`
Mengevaluasi ekspresi kondisional.
```sh
[ EXPR ]
```
- `-f FILE`: *file* biasa?
- `-d FILE`: *file* direktori?
- `-r FILE`: *file* bisa dibaca?
- `-w FILE`: *file* bisa ditulis?
- `STR1 = STR2`: kedua *string* sama?
- `INT1 -eq INT2`: kedua angka sama?
- `INT1 -lt INT2`: lebih kecil?
- `INT1 -gt INT2`: lebih besar?

## `[`

```sh
[ -r /etc/passwd ]; echo $?
  # 0 (true)

[ -w /etc/passwd ]; echo $?
  # 1 (false)

[ "cat" = "long" ]; echo $?
  # 1 (false)

[ 10000 -gt 9999 ]; echo $?
  # 0 (true)
```

## `seq`
Mencetak sekuens angka, berguna untuk *looping*.
```sh
seq [FIRST [INCREMENT]] LAST
```

```sh

seq 10
  # 1 2 3 4 5 6 7 8 9 10

seq 1 2 10
  # 1 3 5 7 9
```

## `read`
Membaca satu baris masukan.
```sh
read NAME...
```

```sh

read input
  # <ketikkan: hello>

echo $input
  # hello
```


# Kontrol Aliran


## Percabangan

```sh
if ...
    then ...
elif ...
    then ...
else
    ...
fi
```

## Kasus

```sh
case WORD in
    PATTERN)
        ... ;;
    PATTERN)
        ... ;;
esac
```

## Perulangan

```sh
for NAME in WORDS
    do ...
done
```

## Perulangan

```sh
while ...
    do ...
done

until ...
    do ...
done
```

## Fungsi

```sh
NAME () {
    ...
}
```


# Contoh


## Percabangan

```sh
#!/bin/sh
# create public_html directory if not exist

webdir="~/public_html"

if [ ! -d $webdir ]; then
    mkdir $webdir
fi

exit 0
```

## Kasus

```sh
#!/bin/sh
# is today weekend?

case $(date +%a) in
    Sat|Sun)
        echo "weekend";;
    *)
        echo "weekday";;
esac
```

## Perulangan

```sh
#!/bin/sh
# cube from 1 to 10

for i in $(seq 10); do
    echo $((i*i*i))
done

exit 0
```

<!--
## Perulangan

```sh
#!/bin/sh
# Caesar cipher (ROT13)

while read line; do
    echo $line | tr A-Z N-ZA-M
done

exit 0
```
-->

## Fungsi

```sh
#!/bin/sh
# Caesar cipher (ROT13)

rot13 () {
    tr A-Z N-ZA-M
}

uppercase () {
    tr a-z A-Z
}

uppercase | rot13

exit 0
```

## Perulangan dan Percabangan

```sh
#!/bin/sh
# integer divisible by 3 or 5 between 1-100

count=0
for i in $(seq 100); do
    if [ $((i%3 == 0 || i%5 == 0)) -eq 1 ]; then
        count=$((count + 1))
    fi
done
echo $count
```

# Latihan

## Frekuensi Kata Terbanyak

Buatlah program "`topwords`{.sh}" untuk mencetak 5 kata dengan frekuensi terbanyak dari masukan `stdin`!

```sh

$ man ls | ./topwords
     21 of
     20 sort
     19 by
     18 the
     16 with
```

---

### Contoh *pipeline*

1. ubah ke *lowercase*
2. jadikan satu kata satu baris
3. urutkan
4. hitung kemunculan kata yang sama
5. urutkan berdasarkan angka secara menurun
6. ambil 5 baris teratas

<!--
---

```sh
#!/bin/sh
# top 5 words

tr A-Z a-z          |
    tr -cs a-z '\n' |
    sort            |
    uniq -c         |
    sort -nr        |
    head -5

exit 0
```
-->

## Identifikasi Penyerang

Server NCC diserang dari luar melalui *port* SSH. Cek isi *log file* `auth.log.gz`[^13-authlog] dan
identifikasi *n* alamat IP penyerang terbanyak!

```sh

$ ./top-ip-attack auth.log.gz 3
116.31.116.52   3859
221.194.47.229  1882
221.194.47.208  1819
```

[^13-authlog]: <https://lms.ipb.ac.id/mod/folder/view.php?id=28806>

---

### Contoh *pipeline*

1. tampilkan *file* log dengan `zcat`{.sh}
2. ambil baris yang mengandung kata `'Failed'`{.sh}
3. ekstrak alamat IP tiap baris
4. urutkan
5. hitung kemunculan alamat IP yang sama
6. urutkan berdasarkan angka secara menurun
7. ambil *n* baris teratas

<!--
---

```sh
#!/bin/sh
# ssh failed attacker

if [ $# -lt 2 ]; then
    echo "Usage: $0 LOGFILE NLIMIT"; exit 1; fi

zcat $1                                 |
    grep 'Failed'                       |
    sed -r 's/^.*from (.*) port.*$/\1/' |
    sort   |   uniq -c   |   sort -nr   |
    awk '{print $2"\t"$1}'              |
    head -n $2

exit 0
```
-->

## Cek Tugas Email

Bantulah asprak SO untuk mengidentifikasi praktikan yang belum mengumpulkan tugas email.
Diberikan *file* `auriza.mbox`[^13-mbox1], ambil nama *user*-nya, kemudian bandingkan dengan
daftar *user* pada *file* `passwd`[^13-passwd]!

```sh

$ ./check-no-mail
anni
michaeln
...
```

[^13-mbox1]: <https://lms.ipb.ac.id/mod/folder/view.php?id=28806>
[^13-passwd]: <https://lms.ipb.ac.id/mod/folder/view.php?id=28806>

---

### Contoh *pipeline*

1. Daftar pengirim email
    1. tampilkan *file* kotak surat
    2. ambil baris yang mengandung kata `'From '`{.sh}
    3. ekstrak nama *user*
    4. urutkan
    5. hilangkan nama yang berulang
2. Daftar semua *user*
    1. tampilkan *file* `/etc/passwd`
    2. ambil baris yang mengandung kata `'G64'`{.sh}
    3. ekstrak nama *user*
    4. urutkan
3. Cari bedanya
    1. bandingkan keluaran dua *pipeline* di atas dengan `diff`{.sh}
    2. sesuaikan format sesuai keluaran yang diminta

<!--
---

```sh
#!/bin/sh
# diff userlist vs usermail

cat auriza.mbox | grep 'From ' | cut -f2 -d' ' |
    cut -f1 -d'@' | sort | uniq > usermail

cat passwd | grep 'G64' | cut -d: -f1 |
    sort > userlist

diff userlist usermail  | grep '<' | cut -c 3-

exit 0
```
-->

## Tugas: *Spelling Checker*[^13-tugas]

Buatlah program untuk mengecek kesalahan ejaan pada dokumen bahasa Inggris.
Gunakan daftar kata pada *file* `words`[^13-words] untuk membandingkan ejaan.
Lihat video berikut[^13-unix] untuk bantuan *pipeline*-nya.
Kumpulkan jawaban di LMS.

```sh
$ ./myspell sentence
laborotories
privide
timesharing
unix
```

[^13-tugas]: tugas bersifat **opsional**, plagiasi akan mendapat sanksi berat.
[^13-unix]: <https://youtu.be/tc4ROCJYbm0?t=5m58s>
[^13-words]: `/usr/share/dict/words`
