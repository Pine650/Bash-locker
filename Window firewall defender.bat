@ECHO OFF
title Window firewall defender

: This is a batch script that can be used to lock and unlock a folder named "Private" on a Windows computer.

rem Check if folder is locked
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK

: The script first checks if the folder "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" exists.

rem Check if folder exists
if NOT EXIST Private goto MDLOCKER

: If this folder exists, the script jumps to the `:UNLOCK` label to prompt the user for a password to unlock the folder.

:CONFIRM
echo Lock? (Y/N)
set /p "choice=>"

rem Make choice case-insensitive
if /I "%choice%"=="Y" goto LOCK
if /I "%choice%"=="N" goto END

: If the user enters "Y", the script jumps to the `:LOCK` label to lock the folder by renaming it
: If the user enters "N", the script ends.

echo Invalid choice.
goto CONFIRM

:LOCK
ren Private "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked
goto End

:UNLOCK
set /p "password=>"

: At the `:UNLOCK` label, the script prompts the user for a password.

rem Check password
if NOT "%password%"=="phamtrunghieu123" goto FAIL

attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Private
echo Folder Unlocked successfully
goto End

:FAIL
echo Invalid password
goto end

: If the password is incorrect, it displays an error message and ends.

:MDLOCKER
md Private
echo Private created successfully
goto End

: At the `:MDLOCKER` label, the script creates a new "Private" folder and displays a success message.

:End 
