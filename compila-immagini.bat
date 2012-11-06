
@echo Compilazione...
latex --src appunti.tex -output-directory="%temp%" -aux-directory="%temp%"
dvips -o "appunti-pics.ps" "%temp%\appunti.dvi"
ps2pdf "appunti-pics.ps"

@echo.
@echo Cancellazione temporanei...
del appunti-pics.ps

@echo.
@echo Esecuzione Acrobat Reader...
appunti-pics.pdf
