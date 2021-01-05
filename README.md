# Dell Inspiron 5370 i5-8250U

![About this Mac](https://i.imgur.com/ynuZMKo.png)

## Specs
* **CPU:** `Intel Core i5-8250U @ 1.8 GHz`
* **iGPU:** `Intel UHD Graphics 620`
* **Storage:** `Sabrent ROCKET NVMe PCIe M.2 2280 512GB`
* **Audio Code:** `Realtek ALC295 (ALC3254)`
* **WiFi Card:** `BCM943602BAED aka DW1830`
* **OS:** `macOS Big Sur 11.1 (20C69)`
* **BIOS:** `v1.16`


## Benchmarks

The following benchmarks were made using Geekbench V5:

- [CPU Single-core and Multi-core](https://browser.geekbench.com/v5/cpu/2830516)
- [GPU Metal](https://browser.geekbench.com/v5/compute/1173808)
- [GPU OpenCL](https://browser.geekbench.com/v5/compute/1173815)

### SSD

![SSD Sabrent Rocket NVMe 3.0 512GB BlackMagic Disk Speed Test](https://i.imgur.com/hEA5Da5.png)
![SSD Sabrent Rocket NVMe 3.0 512GB AmorphousDiskMark](https://i.imgur.com/Z6AI68c.png)

### RAM:

![16GB DDR4 @ 2400MHz AmorphousMemoryMark](https://i.imgur.com/bc99GdJ.png)

## VideoProc Hardware Infos

![Hardware Info detected by VideoProc](https://i.imgur.com/QX4F1Qp.png)

## USB Preparing

Because I don't own a Mac I've created a VM of macOS Mojave 10.14.3 and downloaded the original installer from [gibMacOS](https://github.com/corpnewt/gibMacOS) and made the USB drive using [TINU](https://github.com/ITzTravelInTime/TINU/), a GUI for createinstallmedia. 

Luckily, there's a new way to download macOS Installer: for more infos check [@dortania](https://github.com/dortania) [guide](https://dortania.github.io/OpenCore-Desktop-Guide/installer-guide/mac-install.html)

For the bootloader configuration, I have to thank a lot [@1alessandro1](https://github.com/1alessandro1) and [@marianopela](https://github.com/marianopela), which helped me through the conversion from Clover to Opencore.

### Drivers

Must have for boot:

* OpenRuntime.efi
* HfsPlus.efi

### Kexts

* [AirportBrcmFixup.kext](https://github.com/acidanthera/AirportBrcmFixup/releases/latest)
* [BrcmPatchRam](https://github.com/acidanthera/BrcmPatchRAM/releases/latest)
* [Lilu.kext](https://github.com/acidanthera/Lilu/releases/latest)
* [NoTouchID.kext](https://github.com/al3xtjames/NoTouchID/releases/latest)
* [NVMeFix.kext](https://github.com/acidanthera/NVMeFix/releases/latest)
* [VoodooPS2Controller.kext](https://github.com/acidanthera/VoodooPS2/releases/latest) with **VoodooPS2Mouse.kext** and **VoodooPS2Trackpad.kext** removed due to incompatibility with VoodooI2C kext
* [AppleALC.kext](https://github.com/acidanthera/AppleALC/releases/latest)
* [VirtualSMC.kext](https://github.com/acidanthera/VirtualSMC/releases/latest)
* [WhateverGreen.kext](https://github.com/acidanthera/WhateverGreen/releases)
* [VoodooI2C + VoodooI2CHID](https://github.com/alexandred/VoodooI2C/releases/latest)

## BIOS Settings

After [extracting my BIOS](https://github.com/dreamwhite/bios-extraction-guide/tree/master/Dell) firmware and looking for `DVMT` and `CFG Lock`, I've applied those changes via `modGRUBShell.efi`:

**PLEASE DOUBLE CHECK THE OFFSETS**

- `CFG Lock` to `0x0` using `setup_var 0x527 0x00`
- `DVMT Pre-allocated` to `64M` using `setup_var 0x7E8 0x2`
- `DVMT Total Gfx Mem` to `MAX` using `setup_var 0x7E9 0x3`

In this way, you won't need more `framebuffer-fbmem` and `framebuffer-stolenmem` properties under `DeviceProperties` :) 

You can check the content of my BIOS [here](/BIOS/README.md)

![Offsets](https://i.imgur.com/YnI7V3b.jpg)

## Brightness keys

I've realized (cuz I've removed Windows such as 10 seconds after buying the PC) that the brightness key are not smooth (fluid animation) even in Windows. So I've simply mapped them inside SysPrefs/Keyboard/Shortcuts 

## Crackling sound coming from combojack

Follow [README.md](headphones_fix/README.md)

## Fixing buggy MAT Support

Follow [README.md](SysReport/README.md)

## Gestures

Thanks to VoodooI2C team I've successfully activated native gestures on my hack. Everything is working except 4-fingers gestures, but who cares -_- 

## Credits

* **Apple** for macOS
* **Acidanthera** for some Lilu-based kexts
* **RehabMan** for DSDT patching guide
* **every other people that contributed to the hackintosh world :haha:**



