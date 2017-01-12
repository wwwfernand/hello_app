echo off
set msg=%*

if "%msg%"=="" (
	echo "message required"
) else (
	git add -A
	git commit -m "%msg%"
)
