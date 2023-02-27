@echo off

set TIMESTAMP=%DATE:~10,4%-%DATE:~7,2%-%DATE:~4,2%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%

REM Export all databases into file C:\path\backup\databases.[year][month][day][hour][minutes][seconds].sql
start "" "C:\Program Files\MySQL\MySQL Server 5.6\bin\mysqldump.exe" -uroot -p0546 -h127.0.0.1 -P3306 newdatabase --result-file="D:\backup\AutoBackupTask\newdatabase.%TIMESTAMP%.sql"


REM Change working directory to the location of the DB dump file.
C:
CD \path-to\backup\

REM Compress DB dump file into CAB file (use "EXPAND file.cab" to decompress).
MAKECAB "databases.%TIMESTAMP%.sql" "databases.%TIMESTAMP%.sql.cab"

REM Delete uncompressed DB dump file.
DEL /q /f "databases.%TIMESTAMP%.sql"

:: comment here :v
:: -h for host
:: -p for password
:: -P for Port