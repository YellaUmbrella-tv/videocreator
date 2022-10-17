
:: note: for slatefile, use forward slash / in folder names, else use \\\\

set destfolder=..\output\

:: use black x 2
set black=images/black.png
set white=images/black.png

set prefix=15M_

set fps=59.94
set durtc=00:15:30;00
set maxdur=930
set SOM=01
call blackwhite.bat

set fps=50
set durtc=00:15:30:00
set maxdur=930
set SOM=01
call blackwhite.bat

set fps=50
set durtc=00:15:30:00
set maxdur=930
set SOM=10
call blackwhite.bat

set fps=29.97N
set durtc=00:15:30:00
set maxdur=930.93
set SOM=01
call blackwhite.bat

set fps=23.976
set durtc=00:15:30:00
set maxdur=930.93
set SOM=01
call blackwhite.bat

set fps=25
set durtc=00:15:30:00
set maxdur=930
set SOM=01
call blackwhite.bat

set fps=25
set durtc=00:15:30:00
set maxdur=930
set SOM=10
call blackwhite.bat

set fps=29.97
set durtc=00:15:30;00
set maxdur=930
set SOM=01
call blackwhite.bat


