@echo off
if "%1"=="h" goto begin
start mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
chcp 65001 > nul
SetLocal EnableDelayedExpansion
Set "isDone=False"
Set "BakPath=%~dp0OscBak"
Set "CfgPath=!BakPath:installer\OscBak=!portable_config"
Set "UoscPath=!BakPath!\portable_config_uosc"
Set "PoscPath=!BakPath!\portable_config_osc_p"
if not exist !CfgPath!\mpv.conf (
	echo Please check if the batch script path is correct. 
	echo The batch file should be placed inside the "installer" folder located in the same directory as mpv.exe.
	pause & exit
)
if exist "!BakPath!\InitializationCompleted.md" (
	goto ChangeMode
)
taskkill /f /im mpv* /t >nul 2>nul
(echo #Uosc mode input-conf configuration file. & echo  input-conf = "~~/input_uosc.conf") > "!UoscPath!\mpv.conf"
(echo #Osc_p mode input-conf configuration file. & echo  input-conf = "~~/input_osc_p.conf") > "!PoscPath!\mpv.conf"
for /f "usebackq delims=" %%a in ("!CfgPath!\mpv.conf") do (
	echo %%a | findstr /i /r "input-conf" > nul
	if !errorlevel! neq 0 (
		echo %%a >>"!UoscPath!\mpv.conf"
		echo %%a >>"!PoscPath!\mpv.conf"
	) else (
		set "InputCfgName=%%a"
		set "InputCfgName=!InputCfgName: =!"
		set "InputCfgName=!InputCfgName:"=!"
		if "!InputCfgName:~0,11!" == "input-conf=" (
			if "!InputCfgName:~-5!" == ".conf" (
				for %%b in ("!InputCfgName:/=\!") do (
					set "isDone=True"
					set "InputCfgName=%%~nxb"
				)
			)
		)
	)
)
move /y "!CfgPath!\mpv.conf" "!BakPath!\mpv.conf.bak" >nul
if exist "!CfgPath!\scripts\osc_plus.lua" (
	echo Backup the osc_plus mode files.
	if exist "!CfgPath!\scripts\uosc" (
		robocopy "!CfgPath!\scripts\uosc" "!UoscPath!\scripts\uosc" /e /move /is >nul
	)
	robocopy "!CfgPath!\scripts" "!PoscPath!\scripts" /e /move /is >nul
	rd /s /q "!CfgPath!\scripts" 2>nul
	if exist "!CfgPath!\script-opts" (
		robocopy "!CfgPath!\script-opts" "!PoscPath!\script-opts" /e /move /is >nul
		rd /s /q "!CfgPath!\script-opts" 2>nul
	)
	if !isDone! == True (
		if exist "!CfgPath!\!InputCfgName!" (
			move /y "!CfgPath!\!InputCfgName!" "!PoscPath!\input_osc_p.conf" >nul
		)
	)
	if exist "!CfgPath!\script-opts.conf" (
		move /y "!CfgPath!\script-opts.conf" "!PoscPath!\script-opts.conf" >nul
	)
) else (
	echo Backup the uosc mode files.
	if exist "!CfgPath!\scripts" (
		robocopy "!CfgPath!\scripts" "!UoscPath!\scripts" /e /move /is >nul
		rd /s /q "!CfgPath!\scripts" 2>nul
	)
	if exist "!CfgPath!\script-opts" (
		robocopy "!CfgPath!\script-opts" "!UoscPath!\script-opts" /e /move /is >nul
		rd /s /q "!CfgPath!\script-opts" 2>nul
	)
	if !isDone! == True (
		if exist "!CfgPath!\!InputCfgName!" (
			move /y "!CfgPath!\!InputCfgName!" "!UoscPath!\input_uosc.conf" >nul
		)
	)
	if exist "!CfgPath!\script-opts.conf" (
		move /y "!CfgPath!\script-opts.conf" "!UoscPath!\script-opts.conf" >nul
	)
)
for /f "delims=" %%c in ('dir /a-d /b "!CfgPath!" ^| find "input"') do (
	move /y "!CfgPath!\%%~nxc" "!BakPath!\%%~nxc.bak" >nul
)
echo This MD file is used as a marker for initialization. Please do not delete. > "!BakPath!\InitializationCompleted.md"
robocopy "!PoscPath!" "!CfgPath!" /e /mov >nul
cd /d %~dp0\..
start mpv.exe
exit
:ChangeMode
if exist "!CfgPath!\scripts\osc_plus.lua" (
	echo You will change to Uosc mode. 
	taskkill /f /im mpv* /t >nul 2>nul
	robocopy "!CfgPath!" "!PoscPath!" /s /move /xf profiles.conf /if "*.conf" "*.lua" "*.tcl" >nul
	robocopy "!UoscPath!" "!CfgPath!" /e /mov /is >nul
	cd /d %~dp0\..
	start mpv.exe
) else (
	echo You will change to Osc_plus mode.
	taskkill /f /im mpv* /t >nul 2>nul
	robocopy "!CfgPath!" "!UoscPath!" /s /move /xf profiles.conf /if "*.conf" "*.lua" >nul
	robocopy "!PoscPath!" "!CfgPath!" /e /mov /is >nul
	cd /d %~dp0\..
	start mpv.exe
)
