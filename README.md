# Dell Inspiron 5370 i5-8250U

## Specs
* **CPU:** Intel Core i5-8250U @ 1.8 GHz
* **iGPU:** Intel UHD Graphics 620
* **Storage:** Toshiba KSG60ZMV256G M.2 2280 256GB
* **Audio Codec** Realtek ALC295 (ALC3254)
* **WiFi Card:** QCA9377 replaced with a DW1830
* **OS:** Arch Linux (now removed due to low disk space)


## USB Preparing

Because I don't own a Mac I've created a VM of macOS Mojave 10.14.3 and downloaded the original installer from [gibMacOS](https://github.com/corpnewt/gibMacOS) and made the USB drive using [TINU](https://github.com/ITzTravelInTime/TINU/), a GUI for createinstallmedia.

After preparing the USB, I've downloaded [Clover Bootloader installer](https://github.com/Dids/clover-builder/releases/latest) on the USB and checked in Custom mode:

* Clover for UEFI booting only
* Install Clover in the ESP

## Bootloader

### config.plist

It's the most important file, after drivers and kexts.
Here I've patched [Intel Framebuffer](https://www.tonymacx86.com/threads/guide-intel-framebuffer-patching-using-whatevergreen.256490/) using [Hackintool](https://www.tonymacx86.com/threads/release-hackintool-v2-8-3.254559/)

### Drivers

Must have for boot:

* ApfsDriverLoader.efi
* AptioMemoryFix.efi
* HFSPlus.efi
* VirtualSMC.efi

Dump:

* AudioDxe.efi (Audio codec dump)

FileVault2:

* AppleGenericInput.efi
* AppleUiSupport.efi

### Kexts

* [AirportBrcmFixup.kext](https://github.com/acidanthera/AirportBrcmFixup/releases/latest)* [Bluetooth](https://github.com/headkaze/OS-X-BrcmPatchRAM/releases)* [CodecCommander.kext](https://bitbucket.org/RehabMan/os-x-eapd-codec-commander/downloads/)* EFICheckDisabler.kext* [HibernationFixup.kext](https://github.com/acidanthera/HibernationFixup/releases/latest)* [Lilu.kext](https://github.com/acidanthera/Lilu/releases/latest)* [NoTouchID.kext](https://github.com/al3xtjames/NoTouchID/releases/latest)* [VoodooPS2Controller.kext](https://github.com/acidanthera/VoodooPS2/releases/latest) with **VoodooPS2Mouse.kext** and **VoodooPS2Trackpad.kext** removed due to incompatibility with VoodooI2C kext* [SystemProfilerMemoryFixup.kext](https://github.com/Goldfish64/SystemProfilerMemoryFixup)
 	* Lilu Debug and XCode latest version* ~USBMap.kext~ Replaced with SSDT-xh_oemdb.aml
	* ~Generated with [USBMap](https://github.com/corpnewt/USBMap)~ 	* [AppleALC.kext](https://github.com/acidanthera/AppleALC/releases/latest)* [VirtualSMC.kext](https://github.com/acidanthera/VirtualSMC/releases/latest)* [WhateverGreen.kext](https://github.com/acidanthera/WhateverGreen/releases)
* [VoodooI2C + VoodooI2CHID](https://github.com/alexandred/VoodooI2C/releases/latest)
* [VoodooInput](https://github.com/acidanthera/VoodooInput/releases/latest)

## Headphones issue

Due to a combojack (microphone with headphones jack) in this laptop, after some months I've found the solution:

Download **CodecCommander.kext** place **hda-verb** in */usr/bin*. Next, using AudioDxe.efi driver, in Clover bootloader press F8 for extracting the audio codec in /Volumes/ESP/EFI/CLOVER/misc folder. 

Find Pin-ctls in the codec_dump and next type in terminal

`hda-verb 0x(pin_complex_number) 0x707 0x(headphones pin-ctls)
`

In my case:

`hda-verb 0x19 0x707 0x20
`

But this is a permanent fix because every time you have to type this command (and it's frustrating af).

Here we download ALCPlugFix which will do our dirty work :)

For more infos: [ALCPlugFix](https://osxlatitude.com/forums/topic/11316-how-to-fix-static-noisedistortioncrackling-sound-and-combo-jack-on-laptops/)

**N.B.** Due to macOS Catalina, the system is splitted in two partitions (/ and /Users). The first is read-only and in order to place the ALCPlugFix exec in /usr/bin you have to remount / with RW permissions:

`sudo mount -uw /`

## Brightness keys

~In config.plist there are 4 ACPI renames that are necessary to use fn+F11 and fn+F12 brightness keys:

* Rename _DSM to XDSM
* Rename OSID to XSID (to avoid match against _OSI XOSI patch)
* Rename _OSI to XOSI
* Rename BRT6 to BRTX, use with SSDT-BRT6.aml, SSDT-PNLF.aml, AppleBacklightInjector.kext, and VoodooPS2Controller.kext to fix brightness keys

And in ACPI/patched there are 3 support SSDTs:

* SSDT-BRT6.aml
* SSDT-PNLF.aml
* SSDT-XOSI.aml~

I've realized (cuz I've removed Windows such as 10 seconds after buying the PC) that the brightness key are not smooth (fluid animation) even in Windows. So I've simply mapped them inside SysPrefs/Keyboard/Shortcuts 

## Gestures

~In SysPrefs/Keyboard/Shortcuts/Mission\ Control/ replace "Move left a space" and "Move right a space" with your favourite ones.

Personally I use three-fingers swipe right for "Move right a space" and viceversa for left swipe~

Thanks to VoodooI2C team I've successfully activated native gestures on my hack. Everything is working except 4-fingers gestures, but who cares -_- 

## Some useful links

[Combojack](https://osxlatitude.com/forums/topic/11316-how-to-fix-static-noisedistortioncrackling-sound-and-combo-jack-on-laptops/)

[How does AppleALC work](https://osxlatitude.com/forums/topic/1946-complete-applehda-patching-guide/)

[gibMacOS](https://github.com/corpnewt/gibMacOS)

## Credits

* **Apple** for macOS
* **Acidanthera** for some Lilu-based kexts
* **RehabMan** for DSDT patching guide
* **every other people that contributed to the hackintosh world :haha:**



