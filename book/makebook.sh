# strip and adjust header
for chapter in ../[01]*.md; do
    cat $chapter                |
        sed 's/^#/##/'          |
        sed 's/^##inc/#inc/'    |
        sed 's/^##def/#def/'    |
        sed 's/^##!/#!/'        |
        sed 's/^title:/\n#/'    |
        sed 's/\\centering//'   |
        grep -Ev '(author:|institute:|date:|theme:|header-includes:|usepackage|renewcommand|setmainlanguage|setotherlanguage|newfontfamily|^---$)' > $(basename $chapter)
done

sed -i 's/dont-sigkill-l.png/dont-sigkill.png/' 12*.md

# add book metadata
cat > 00-title.md << EOF
---
title: Praktikum Sistem Operasi
author: Auriza Akbar
date: 2017
publisher: Ilmu Komputer IPB
papersize: a4
documentclass: book
toc: true
toc-depth: 2
lof: true
header-includes:
    - \usepackage{tikz}
    - \renewcommand*\contentsname{Daftar Isi}
    - \renewcommand{\partname}{Bagian}
    - \renewcommand{\listfigurename}{Daftar Gambar}
    - \renewcommand{\listtablename}{Daftar Tabel}
    - \renewcommand{\figurename}{Gambar}
    - \renewcommand{\tablename}{Tabel}
---

\part{Pemrograman Sistem UNIX}
EOF
echo "\part{Administrasi Sistem UNIX}" > 07.md



## Classic Thesis Book ---------------------------------------------------------

#pandoc -s *.md -o book.tex
#sed '1d' book.tex > body.tex
#cat > head.tex << EOF
#\documentclass[11pt,a4paper,footinclude=true,headinclude=true]{scrbook}
#\usepackage[linedheaders,parts,pdfspacing]{classicthesis}
#EOF
#cat head.tex body.tex > book.tex
#sed -i '/hyperref/d' book.tex
#sed -i '/\\begin{document}/a \
#\\frontmatter' book.tex
#sed -i '/\\listoffigures/a \
#\\mainmatter' book.tex
#
#pdflatex book.tex
#pdflatex book.tex
#mv book.pdf os-lab_.pdf


## Tufte Book ------------------------------------------------------------------

pandoc -s *.md -o book.tex
sed -i 's/]{book}/nohyper]{tufte-book}/' book.tex
sed -i 's/subsubsection/paragraph/' book.tex
sed -i 's/\\title{Praktikum/\\title{Praktikum\\\\/' book.tex
sed -i 's/\\date{2017}/\\publisher{Ilmu Komputer IPB}/' book.tex
sed -i '/\\begin{document}/a \
\\frontmatter\\pagenumbering{roman}' book.tex
sed -i '/\\listoffigures/a \
\\mainmatter\\setcounter{page}{1}\\pagenumbering{arabic}' book.tex

pdflatex book.tex
pdflatex book.tex
mv book.pdf os-lab.pdf

## -----------------------------------------------------------------------------

rm *md *tex *aux *log *toc *out *lof
