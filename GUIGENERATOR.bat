@echo off
:welcomepart
title GUI GENERATOR
cls
echo ============================================================
echo                         WELCOME
echo ============================================================
set /p variable1=First, please select GUI type. Type A for notification or B for alert. 
if %variable1% == A goto notification
if %variable1% == B goto alert
if %variable1% == a goto notification
if %variable1% == b goto alert
echo No!

:notification
title notification generator
set /p nottitle=Please enter a notification title.
set /p nottext=Please enter a notification text.
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, '%nottitle%', '%nottext%', [System.Windows.Forms.ToolTipIcon]::None)}"
echo Done!
echo Press any key to go to main menu. Press ALT+F4 to exit.
pause > nul
goto welcomepart


:alert
title alert generator
set /p alerttitle=Please enter a alert title.
set /p alerttext=Please enter a alert text.
set /p alertbutton=Please enter a button title.
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('%alerttext%', '%alerttile%', '%alertbutton%', [System.Windows.Forms.MessageBoxIcon]::Information);}"
echo Done!
echo Press any key to go to main menu. Press ALT+F4 to exit.
pause > nul
goto welcomepart

