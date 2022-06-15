#!/bin/bash
# screen, ebook, prepress, printer, default

"gs" -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile=build/cv.pdf build/main.pdf

ln -s build/cv.pdf cv.pdf

cd about
cp paragraph.md paragraph.txt

