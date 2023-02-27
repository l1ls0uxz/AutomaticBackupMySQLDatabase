@echo off
:: using forfiles to del old file afterr X days.
FORFILES /p "D:\backup" /s /m *.sql /D -1 /C "cmd /c del @file"