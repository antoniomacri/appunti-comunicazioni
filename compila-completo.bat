@echo off

del *.aux
del *.toc
del *.out
del *.dvi
del *.log


echo.
echo.
echo **************************************************
echo * Avvio pdfLaTeX per compilazione appunti
echo *
echo.
pause

pdflatex appunti.tex


echo.
echo.
echo **************************************************
echo * Compilazione immagini
echo *
echo.
pause

latex --src appunti.tex
dvips -o "appunti-pics.ps" "appunti.dvi"
ps2pdf "appunti-pics.ps"
del appunti-pics.ps


echo.
echo.
echo **************************************************
echo * Compilazione bibliografia
echo *
echo.
pause

bibtex appunti
del appunti.aux

echo.
echo.
echo **************************************************
echo * Avvio pdfLaTeX tre volte (per i riferimenti)
echo *
echo.
pause

pdflatex appunti.tex
pdflatex appunti.tex
pdflatex appunti.tex


echo.
echo.
echo **************************************************
echo * Cancellazione file temporanei
echo *
echo.
pause

del *.aux
del *.toc
del *.out
del *.dvi
del *.log


echo.
echo.
echo **************************************************
echo * Apertura file PDF di output
echo *
echo.
pause

appunti.pdf