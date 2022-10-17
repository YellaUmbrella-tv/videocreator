
:: note: for slatefile, use forward slash / in folder names, else use \\\\

set destfolder=..\output\

:: use black x 2
set black=images/black.png
set white=images/black.png

set prefix=90S_

set fps=59.94
set durtc=00:01:30;00
set maxdur=90
set SOM=01
call blackwhite.bat

set fps=50
set durtc=00:01:30:00
set maxdur=90
set SOM=01
call blackwhite.bat

set fps=50
set durtc=00:01:30:00
set maxdur=90
set SOM=10
call blackwhite.bat

set fps=29.97N
set durtc=00:01:30:00
set maxdur=90.09
set SOM=01
call blackwhite.bat

set fps=23.976
set durtc=00:01:30:00
set maxdur=90.09
set SOM=01
call blackwhite.bat

set fps=25
set durtc=00:01:30:00
set maxdur=90
set SOM=01
call blackwhite.bat

set fps=25
set durtc=00:01:30:00
set maxdur=90
set SOM=10
call blackwhite.bat

set fps=29.97
set durtc=00:01:30;00
set maxdur=90
set SOM=01
call blackwhite.bat


