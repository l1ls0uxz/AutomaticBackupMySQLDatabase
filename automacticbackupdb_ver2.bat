@echo off

set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)

set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%

set SUBFILENAME=%CUR_DD%-%CUR_MM%-%CUR_YYYY%_%CUR_HH%-%CUR_NN%-%CUR_SS%

REM Export all databases into file C:\path\backup\databases.[year][month][day][hour][minutes][seconds].sql
start "" "C:\Program Files\MySQL\MySQL Server 5.6\bin\mysqldump.exe" -uroot -p0546 -h127.0.0.1 -P3306 newdatabase --result-file="D:\backup\AutoBackupTask\newdatabase.%SUBFILENAME%.sql"
