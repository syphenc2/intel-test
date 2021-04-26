Color 17 
ECHO OFF
CLS 
: MENU
ECHO.
ECHO              By Evan Yousif
ECHO                               Infomation Gathering   
ECHO .....................................................................
ECHO             Select A Number To Select Yout task, or E to EXIT
ECHO .....................................................................
ECHO.
ECHO                    1 - LIST DRIVERS INSTALLED ON PC
ECHO                    2 - GET FILE SECURITY INFO
ECHO                    3 - LIST CURRENT RUNNING TASK
ECHO                    4 - KILL TASK
ECHO                    5 - DISPLAY A TEXT FILE ON SCREEN 
ECHO                    6 - LIST INSTALLED PRINTERS
ECHO                    7 - SHOW HOSTNAME
ECHO                    8 - SHOW IP ADDRESS
ECHO                    9 - SHOW DNS SERVERS
ECHO                    0 - SHOW DEFUALT GATEWAY
ECHO                    E - EXIT
ECHO.
SET /P M=Type 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, or E then press ENTER:
IF %m%==1 GOTO LISTDR
IF %m%==2 GOTO FILSEC
IF %m%==3 GOTO CRTASK
IF %m%==4 GOTO KLTASK
IF %m%==5 GOTO DISFIL
IF %m%==6 GOTO LSPRIN
IF %m%==7 GOTO SHOSTN
IF %m%==8 GOTO SHOWIP
IF %m%==9 GOTO SHODNS
IF %m%==0 GOTO SGATEW
IF %m%==E GOTO EXIT
:LISTDR
ECHO.
ECHO             List Drivers Installed on PC
ECHO.
DriverQuery /FO list /v | More
pause
GOTO MENU
:FILSEC
ECHO.
ECHO             File Security INFO
ECHO.
set /p yes="Enter File Path" CACLS %yes%
more
pause
GOTO MENU
:CRTASK
ECHO.
ECHO             List Current Running Task
ECHO.
TASKLIST /v /fi "STATUS eq running" |More
pause
GOTO MENU
:KLTASK
GOTO MENU
:DISFIL
ECHO.
ECHO             Display Text File 
ECHO.
set /p yes="Enter File Path" TYPE [drive:]pathname(s)%yes%
more
pause
GOTO MENU
:LSPRIN
ECHO.
ECHO             List Installed Printers
ECHO.
Cscript %WINDIR%\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs -l | More
pause
GOTO MENU
:SHOSTN
ECHO.
ECHO             System HOSTNAME
ECHO.
Hostname | More
pause
GOTO MENU
:SHOWIP
ECHO.
ECHO            IP Address list
ECHO.
IPconfig | More
pause
GOTO MENU
:SHODNS
ECHO.
ECHO            Show DNS SERVERS
ECHO.
ipconfig /displaydns | More
pause
GOTO MENU
:SGATEW
ECHO.
ECHO            Show Default GATEWAY
ECHO.
ipconfig | findstr /i "Gateway" | More
pause
GOTO MENU
:EXIT
EXIT

