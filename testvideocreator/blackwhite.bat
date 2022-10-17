

if NOT "%ext%"=="" goto next
set ext=mxf

:next
::set maxdur=300
::set fps=29.97
::set fps=23.976
if NOT "%fps%"=="" goto continue
set durtc=01:01:00;00
set destfolder=..\output\
set fps=29.97
::set maxdur=3660.0
set maxdur=130
set SOM=01
set ext=mp4

:: enable this if you have cuda and are making mp4.
set codecparams=-c:v h264_nvenc


:continue

mkdir %destfolder%

::set codecparams=-pix_fmt yuv422p -vcodec mpeg2video -flags +ildct+ilme -top 1 -dc 10 -flags2 +ivlc+non_linear_q -qmin 1 -lmin 1*QP2LAMBDA -vtag xd5c -rc_max_vbv_use 1 -rc_min_vbv_use 1 -b 50000k -minrate 50000k -maxrate 50000k -bufsize 36408333 -bf 2 -aspect 16:9
::set codecparams=-pix_fmt yuv422p -vcodec mpeg2video -flags +ildct+ilme -top 1 -dc 10 -qmin 1 -lmin 1*QP2LAMBDA -vtag xd5c -rc_max_vbv_use 1 -rc_min_vbv_use 1 -b 50000k -minrate 50000k -maxrate 50000k -bufsize 36408333 -bf 2 -aspect 16:9
::set codecparams=

set /a "hh=%SOM%-1"
SET hh=00%hh%
SET hh=%hh:~-2%

if %fps%==25 (
set src=-f lavfi -i color=c=black:s=1920x1080:r=25 -f lavfi -i anullsrc=channel_layout=mono:sample_rate=48000
:: set src=-i 25fps_subtitle_test_content.mxf
set tag=%fps%fps_subtitle_test_content_
set timecodestart=%hh%\:59\:30\:00
set timecodeset=%hh%:59:30:00
set tcsuffix=
set framerate=25
set extrainfo=TC is real time
set /a "twentysecframes=20*25"
set /a "slateframes=30*25"
set /a "pictureframes=30*25"
set beeptime=0.5
)

if %fps%==50 (
set src=-f lavfi -i color=c=black:s=1920x1080:r=50 -f lavfi -i anullsrc=channel_layout=mono:sample_rate=48000
:: set src=-i 25fps_subtitle_test_content.mxf
set tag=%fps%fps_subtitle_test_content_
set timecodestart=%hh%\:59\:30\:00
set timecodeset=%hh%:59:30:00
set tcsuffix=
set framerate=50
set extrainfo=TC is real time
set /a "twentysecframes=20*50"
set /a "slateframes=30*50"
set /a "pictureframes=30*50"
set beeptime=0.5
)


if %fps%==23.976 (
set src=-f lavfi -i color=c=black:s=1920x1080:r=24000/1001 -f lavfi -i anullsrc=channel_layout=mono:sample_rate=48000
::set src=-i 2398fps_subtitle_test_content.mxf
set tag=%fps%fps_subtitle_test_content_
set timecodestart=%hh%\:59\:30\:00
set timecodeset=%hh%:59:30:00
set firstactive=%SOM%:00:00:00
set tcsuffix=@24
set framerate=24000/1001
set extrainfo=Note - TC DOES NOT REFLECT REAL TIME
set /a "twentysecframes=20*24"
set /a "slateframes=30*24"
set /a "pictureframes=30*24"
set beeptime=0.5
)

if %fps%==29.97 (
:: set src=-i 2997fps_subtitle_test_content.mxf
set src=-f lavfi -i color=c=black:s=1920x1080:r=30000/1001 -f lavfi -i anullsrc=channel_layout=mono:sample_rate=48000
set tag=%fps%fps_subtitle_test_content_
set timecodestart=%hh%\:59\:30\;00
set timecodeset=%hh%:59:30;00
set tcsuffix=@30drop
set firstactive=%SOM%:00:00;00
set framerate=30000/1001
set extrainfo=TC is real time drop frame
::set /a "twentysecframes=20*30*1000/1001
set twentysecframes=599
::set /a "slateframes=30*30*1000/1001"
:: want a whole number to subtract
set slateframes=899
set pictureframes=899.1008991008991
set beeptime=0.5
)

if %fps%==59.94 (
:: set src=-i 2997fps_subtitle_test_content.mxf
set src=-f lavfi -i color=c=black:s=1920x1080:r=60000/1001 -f lavfi -i anullsrc=channel_layout=mono:sample_rate=48000
set tag=%fps%fps_subtitle_test_content_
set timecodestart=%hh%\:59\:30\;00
set timecodeset=%hh%:59:30;00
set tcsuffix=@60drop
set firstactive=%SOM%:00:00;00
set framerate=60000/1001
set extrainfo=TC is real time drop frame
::set /a "twentysecframes=20*30*1000/1001
set twentysecframes=1198
::set /a "slateframes=30*30*1000/1001"
:: want a whole number to subtract
set slateframes=1798
set pictureframes=1798.201798201798
set beeptime=0.5
)

if %fps%==29.97N (
:: set src=-i 2997fps_subtitle_test_content.mxf
set src=-f lavfi -i color=c=black:s=1920x1080:r=30000/1001 -f lavfi -i anullsrc=channel_layout=mono:sample_rate=48000
set tag=2997NDFfps_subtitle_test_content_
set timecodestart=%hh%\:59\:30\:00
set timecodeset=%hh%:59:30:00
set tcsuffix=@30nondrop
set firstactive=%SOM%:00:00:00
set framerate=30000/1001
set extrainfo=TC is non real time non-drop
::set /a "twentysecframes=20*30*1000/1001
set twentysecframes=599
::set /a "slateframes=30*30*1000/1001"
:: want a whole number to subtract
set slateframes=899
set pictureframes=899.1008991008991
set beeptime=0.5
)

set dest=%destfolder%%prefix%%tag%%SOM%.%ext%

echo Subtitle Test Media >slates\\newslate_%fps%_%SOM%.txt
echo Start TC: %timecodeset%%tcsuffix% >>slates\\newslate_%fps%_%SOM%.txt
echo First Active Frame: %firstactive%%tcsuffix% >>slates\\newslate_%fps%_%SOM%.txt
echo Duration: %durtc%%tcsuffix% >>slates\\newslate_%fps%_%SOM%.txt
echo Real Duration: %maxdur%s >>slates\\newslate_%fps%_%SOM%.txt
echo Audio 8 channels >>slates\\newslate_%fps%_%SOM%.txt
echo %extrainfo% >>slates\\newslate_%fps%_%SOM%.txt


set slatefile=slates/newslate_%fps%_%SOM%.txt

if "%black%"=="" (
  set black=images/black.png
)
if "%white%"=="" (
  set white=images/white.png
)

set fontsize=48

set font=fontsize=%fontsize%:fontcolor=white:fontfile='c\:\\windows\\fonts\\LSANS.TTF':box=1:boxcolor=#00000040:boxborderw=5:line_spacing=10

set removeslate=drawtext=%font%:enable='between(n,0,%slateframes%)':textfile=%slatefile%:x=3:y=h/4:fontcolor=black:boxcolor=#000000ff:fontsize=140
set addslate=drawtext=%font%:enable='between(n,0,%slateframes%)':textfile=%slatefile%:x=w/3:y=h/3
set textx=w-tw-w*0.2
set numwidth=%fontsize%*3/5
set yline=1
set addtimecodetext=drawtext=%font%::text='Source TC':x=%textx%:y=25+48*%yline%
set addtimecode=drawtext=%font%:timecode='%timecodestart%':rate=%framerate%:x=w-tw-25-%numwidth%:y=25+48*%yline%

set yline=2
set addtimeText=drawtext=%font%:text='Time':x=%textx%:y=25+48*%yline%
set addtime=drawtext=%font%:text='%%{pts\:hms}':x=w-tw-25:y=25+48*%yline%

set yline=3
set addframesText=drawtext=%font%:text='Frame':x=%textx%:y=25+48*%yline%
set addframes=drawtext=%font%:text='%%{frame_num}':x=w-tw-25-%numwidth%:y=25+48*%yline%


::set addimages=-i %black% -r %framerate% -i %white% -r %framerate%
set addimages=-framerate %framerate% -i %black% -framerate %framerate% -i %white%
set addwhite=overlay=x=0:y=0:enable='if(gt(n,%slateframes%),lt(mod(n-%slateframes%,%pictureframes%*2),%pictureframes%))'
set addblack=overlay=x=0:y=0:enable='if(gt(n,%slateframes%),gte(mod(n-%slateframes%,%pictureframes%*2),%pictureframes%))'


:: add a beep between 0-20s, and for 1s every 30s.
set addbeep=sine=d=%maxdur%:f=800:sample_rate=48000[beep];[beep]volume=0:enable='between(t,20,30)+gte(mod(t - 30,30),%beeptime%)*gte(t,30)'[audioout]

set mapaudio=-map [audioout]:a:0 -map 1:a:0 -map 1:a:0 -map 1:a:0 -map 1:a:0 -map 1:a:0 -map 1:a:0 -map 1:a:0

set addmxftimecode=-timecode ^"%timecodeset%^"

:: add for dnxhd
::,format=yuv422p 
::-vcodec dnxhd 
::-profile:v dnxhr_lb 

::set extraparams=-hwaccel cuda -hwaccel_output_format cuda 
::set extraparams=-hwaccel cuda

call ffmpeglocation.bat

rem D:\Data\Common\Apps\ffmpeg-20191109-0f89a22-win64-static\bin\ffmpeg ^

%ffmpeg% ^
%extraparams% ^
%src% ^
%addimages% ^
-to %maxdur% ^
-thread_type frame ^
-filter_complex ^"^
%addbeep%, ^
%addwhite%, ^
%addblack%, ^
%removeslate%, ^
%addslate%, ^
%addtimecodetext%, ^
%addtimecode%, ^
%addtimetext%, ^
%addtime%, ^
%addframestext%, ^
%addframes% ^
 ^" ^
%mapaudio% ^
%addmxftimecode% ^
%codecparams% ^
-y ^
%dest%

set fps=
