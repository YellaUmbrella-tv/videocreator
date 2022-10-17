::set codecparams=-c:v h264_nvenc
:: enable this if you have cuda.
set codecparams=-c:v h264_nvenc
set ext=mp4
call ./makemedia1hour.bat
