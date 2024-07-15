# guix_channel
My own custom guix package definitions which are not interesting enough to contribute

## Contains
- [Poor DWM fork](https://github.com/brandhout/poor_dwm_fork)
- [Poor ST fork](https://github.com/brandhout/poor_st_fork):
- [Open Lighting Console](https://github.com/mikacousin/olc)
- [OLA](https://github.com/OpenLightingProject/ola)

This channel contains the Open Lighting console and an updated version of OLA with an updated libusb to support this as the current OLA is broken on guix due to libusb. Fixing this in Guix takes some time. 

Python-sacn has recently landed in Guix master.

##Relevant patches

[PATCH gnu: libusb update to 1.0.26](https://issues.guix.gnu.org/72032)
[PATCH Update ola to 0.10.9](https://issues.guix.gnu.org/72033)


