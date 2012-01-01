#!/bin/bash
## Script to generate pdf file from Rnw file and place it in the right place
Rscript -e 'library(knitr); knit("sp23design.Rnw")'
pdflatex sp23design
bibtex sp23design
pdflatex sp23design
pdflatex sp23design
rm sp23design.log sp23design.aux sp23design.blg sp23design.bbl sp23design.out sp23design.toc sp23design.tex
mv sp23design.pdf ../doc

