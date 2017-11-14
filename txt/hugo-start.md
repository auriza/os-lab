---
title: "Hugo Start"
date: 2017-11-14T15:50:20+07:00
draft: false
---

Hugo adalah generator situs web statik.
Halaman ditulis menggunakan Markdown.

# Inisialisasi Situs Baru

```sh
hugo new site 'blog'
cd blog
git init
git submodule add 'https://github.com/budparr/gohugo-theme-ananke.git' themes/ananke
echo 'theme = "ananke"' >> config.toml
```

# Link Akses Publik

```sh
ln -s ~/blog/public/ ~/public_html/blog
```

# Tulis Post Baru

```sh
hugo new posts/my-first-post.md
editor content/posts/my-first-post.md
```

Pastikan *header* dokumen `draft: true` diset menjadi `false` agar terpublikasi.

# Generate Situs Statik

```sh
hugo -b http://os.apps.cs.ipb.ac.id/~$USER/blog
```

Buka laman di atas untuk melihat situs baru anda.

Setiap kali menambahkan atau mengubah isi post, jalankan perintah `hugo` di
atas untuk meng-generate perubahan isi situs.
