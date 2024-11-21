# guix_channel
My own custom guix package definitions which are not interesting enough to contribute, or others that still need contributing but don't yet comply to the packaging standards.

Feel free to use this repo and file issues.

## Contains (Including some inputs of)
- [Poor DWM fork](https://github.com/brandhout/poor_dwm_fork)
- [Poor ST fork](https://github.com/brandhout/poor_st_fork):
- [Open Lighting Console](https://github.com/mikacousin/olc)
- neovim 0.10.2
- python-airium
- python-rtmidi

This channel contains the Open Lighting console and an updated libusb to support this as the current OLA is broken on guix due to libusb. Fixing this in Guix takes some time. 

Python-sacn, python-pyet, OLA have recently landed in Guix master.

##Relevant patches

[PATCH gnu: libusb update to 1.0.26](https://issues.guix.gnu.org/72032)


