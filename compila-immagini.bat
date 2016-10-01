
@echo Compilazione...
latex --src appunti.tex
dvips -o "appunti-pics.ps" "appunti.dvi"
ps2pdf "appunti-pics.ps"

@echo.
@echo Cancellazione temporanei...
del appunti-pics.ps

@echo.
@echo Esecuzione Acrobat Reader...
appunti-pics.pdf
