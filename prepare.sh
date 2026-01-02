#!/bin/bash
# screen, ebook, prepress, printer, default

"gs" -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile=academic/build/cv.pdf academic/build/main.pdf
"gs" -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile=industrial/build/cv.pdf industrial/build/main.pdf

cp academic/build/cv.pdf academic_cv.pdf
cp industrial/build/cv.pdf cv.pdf
