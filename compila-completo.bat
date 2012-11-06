@echo off

del %temp%\*.aux
del %temp%\*.toc
del %temp%\*.out
del %temp%\*.dvi
del %temp%\*.log
del *.aux


echo.
echo.
echo **************************************************
echo * Avvio pdfLaTeX per compilazione appunti
echo *
echo.
pause

pdflatex appunti.tex -aux-directory=%temp%


echo.
echo.
echo **************************************************
echo * Compilazione immagini
echo *
echo.
pause

copy %temp%\appunti.aux .
latex --src appunti.tex -output-directory="%temp%" -aux-directory="%temp%"
dvips -o "appunti-pics.ps" "%temp%\appunti.dvi"
ps2pdf "appunti-pics.ps"
del appunti-pics.ps


echo.
echo.
echo **************************************************
echo * Compilazione bibliografia
echo *
echo.
pause

bibtex %temp%\appunti -include-directory=%temp%
del appunti.aux

echo.
echo.
echo **************************************************
echo * Avvio pdfLaTeX tre volte (per i riferimenti)
echo *
echo.
pause

pdflatex appunti.tex -aux-directory=%temp%
pdflatex appunti.tex -aux-directory=%temp%
pdflatex appunti.tex -aux-directory=%temp%


echo.
echo.
echo **************************************************
echo * Cancellazione file temporanei
echo *
echo.
pause

del %temp%\*.aux
del %temp%\*.toc
del %temp%\*.out
del %temp%\*.dvi
del %temp%\*.log
del *.aux


echo.
echo.
echo **************************************************
echo * Apertura file PDF di output
echo *
echo.
pause

appunti.pdf