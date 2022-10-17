# Test Video Creator

This repo is a set of Windows batch files and an ffmpeg executable

It's purpose is to create parameterised test media.

## simplest use case:

clone the repo of simply download the zip of the repo.

Start a command prompt, and change directory to the location of /testvideocreator from this repo.

run `asmp4_15min.bat` to create media.  ( this will take a while).

Media created by default is different frame rates and different SOM values.  These are controlled by the settings in makemediaXXyyy.bat

e.g. the default repo creates:

```
59.94 SOM 01
50 SOM 01
50 SOM 10
29.97N (non drop TC) SOM 01
23.976 SOM 01
25 SOM 01
25 SOM 10
29.97 (drop frame TC) SOM 01
```

By default, makemedia produces MXF files.  asmp4 changes a variable or two to produce .mp4 video (a lot smaller on disk).  Both have machine readable timecode.

By default, all media has a 30s slate on the front with text describing the media.

All media has running timecode burnt in, as well as real-time time, and frame count (from first frame of media).

The background image after the slate is made from TWO PNG images in the images folder.  The images used are controlled using the batch variables `black` and `white`, 
and the images swap every 30s.  The default repo uses black.png for both images.

There are batch files for 90s, 15 min and 1 hour media.

## Audio:

All media produced has 8 tracks of audio.  The audio has 20s of tone at the start, then a 'pip' every 30s from SOM onwards.

## Slate:

![image](https://user-images.githubusercontent.com/3137332/196199813-4b1b4ad7-5c42-4686-8815-fd18068cda11.png)

## After SOM:

![image](https://user-images.githubusercontent.com/3137332/196199999-73ab0a21-503c-4d45-91f3-992cb0e3d0f3.png)





