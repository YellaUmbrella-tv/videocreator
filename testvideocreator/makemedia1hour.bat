
:: note: for slatefile, use forward slash / in folder names, else use \\\\

set destfolder=..\output\

:: use black x 2
set black=images/black.png
set white=images/black.png

set prefix=1H_

set fps=59.94
set durtc=01:01:00;00
set maxdur=3660
set SOM=01
call blackwhite.bat

set fps=50
set durtc=01:01:00:00
set maxdur=3660
set SOM=01
call blackwhite.bat

set fps=50
set durtc=01:01:00:00
set maxdur=3660
set SOM=10
call blackwhite.bat

set fps=29.97N
set durtc=01:01:00:00
set maxdur=3663.660
set SOM=01
call blackwhite.bat

set fps=23.976
set durtc=01:01:00:00
set maxdur=3663.660
set SOM=01
call blackwhite.bat

set fps=25
set durtc=01:01:00:00
set maxdur=3660
set SOM=01
call blackwhite.bat

set fps=25
set durtc=01:01:00:00
set maxdur=3660
set SOM=10
call blackwhite.bat

set fps=29.97
set durtc=01:01:00;00
set maxdur=3660
set SOM=01
call blackwhite.bat


