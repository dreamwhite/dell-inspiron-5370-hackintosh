# OpenCore 0.8.6 - Dell Inspiron 5370 i5-8250U

## Only for educational purposes

[![BIOS](https://img.shields.io/badge/BIOS-1.22-important.svg)](https://www.dell.com/support/home/en-us/product-support/product/inspiron-13-5370-laptop/drivers)
[![OpenCore 
Version](https://img.shields.io/badge/OpenCore-0.8.6-cyan.svg)](https://github.com/acidanthera/OpenCorePkg/releases/latest)
[![macOS 
Ventura](https://img.shields.io/badge/macOS-13.0.1%20(22A400)-white.svg)](https://www.apple.com/macos/ventura/)
[![Release](https://img.shields.io/badge/Download-latest-success.svg)](https://github.com/dreamwhite/dell-inspiron-5370-hackintosh/releases/latest)
[![Main](https://github.com/dreamwhite/dell-inspiron-5370-hackintosh/actions/workflows/main.yml/badge.svg)](https://github.com/dreamwhite/dell-inspiron-5370-hackintosh/actions/workflows/main.yml)

![About this Mac](.assets/docs/about_this_mac.png)

## Specs

| Component      | Brand                                     |
|----------------|-------------------------------------------|
| **CPU**        | `Intel Core i5-8250U @ 1.8 GHz`           |
| **iGPU**       | `Intel UHD Graphics 620`                  |
| **Storage**    | `Western Digital SN750 Black NVMe 512GB`  |
| **Audio Code** | `Realtek ALC295 (ALC3254)`                |
| **WiFi Card**  | `Fenvi BCM94360NG with native firmware`   |
| **OS**         | `macOS Ventura 13.0.01 (22A400)`          |
| **BIOS**       | `v1.22`                                   |

## Supported versions

| Version 	| Supported 	|
|---	|---	|
| 10.4.x 	| :x: 	|
| 10.5.x 	| :x: 	|
| 10.6.x 	| :x: 	|
| 10.7.x 	| :x: 	|
| 10.8.x 	| :x: 	|
| 10.9.x 	| :x: 	|
| 10.10.x 	| :x: 	|
| 10.11.x 	| :x: 	|
| 10.12.x 	| :x: 	|
| 10.13.x 	| :heavy_exclamation_mark: Untested but should work	|
| 10.14.x 	| :white_check_mark: 	|
| 10.15.x 	| :white_check_mark: 	|
| 11.x 	| :white_check_mark: 	|
| 12.x 	| :white_check_mark: 	|
| 13.x 	| :white_check_mark: 	|


### Working/Not working:

###### Click on the arrow icons to expand the spoilers
<details>
<summary>iGPU</summary>
  
- [x] Intel UHD 620 iGPU Backlight support
- [x] Intel UHD 620 iGPU HDMI1.4b Output (1920x1080@120Hz)
- [x] Intel UHD 620 iGPU Type-C to HDMI Output
- [x] Intel UHD 620 iGPU - H264 & HEVC
</details>

<details>
<summary>Audio</summary>
  
- [x] ALC295 Internal Speakers
- [x] ALC295 Internal Microphone
- [x] ALC295 Combojack headphones
- [ ] ALC295 Combojack microphone - Not interested at all
- [x] ALC295 HDMI Audio Output
- [x] ALC295 Type-C to HDMI Audio Output
</details>

<details>
<summary>USB</summary>
  
- [x] All USB ports working and mapped
- [x] Micro SD Card Reader (USB based)
- [x] Webcam (USB based)
</details>

<details>
<summary>Keyboard</summary>
  
- [x] Keyboard (PS2 based)
- [x] HID Key PWRB & SLPB 
- [x] F11 & F12 remapped brightness keys
- [x] F13 Print Screen remapped key
- [x] Multimedia control sound keys
</details>

<details>
<summary>Trackpad</summary>
  
- [x] I2C Touchpad with gestures
- [x] Force Touch
</details>


<details>
<summary>Misc</summary>
  
- [x] SpeedStep
- [x] Sleep/Wake using both `hibernatemode` `0` and `25`
- [x] Wi-Fi/BT 4.1 `BCM94360NG` module with Continuity and Airdrop support (both from iPhone to Mac and viceversa)
- [x] SATA/NVMe PCIe Gen3x4 on M.2 slot
- [x] Sensors CPU, iGPU, Battery, NVMe, Fans
- [x] Native ACPI Battery 8-bit support
- [x] Native NVRAM support
- [x] Recovery (macOS) boot from OpenCore
- [x] Windows 10/Linux boot from OpenCore
- [x] macOS Ventura Continuity Camera
</details>

### Documentation

- [USB Preparing](/Docs/usb_preparation/README.md)
- [Benchmarks](/Docs/README.md#benchmarks)
- [SSDTs](/Docs/README#ssdt)
- [Drivers](/Docs/README#drivers)
- [Kexts](/Docs/Kexts.md)
- [BIOS Settings](/Docs/BIOS/README.md)
- [Crackling sound coming from combojack](/Docs/headphones_fix/README.md)
- [Fixing buggy MAT Support](/Docs/SysReport/README.md)
- [USB Mapping](/Docs/ACPI/SSDT-3-xh_OEMBD.md)
- [WiFi/BT](/Docs/wifi_and_bt/README.md)
- [FileVault2](/Docs/FileVault2/README.md)
- [Graphics patch](/Docs/graphics_patch/README.md)
- [HiDPI](/Docs/hidpi/README.md)

## Brightness keys

I've realized (cuz I've removed Windows such as 10 seconds after buying the PC) that the brightness key are not smooth (fluid animation) even in Windows. So I've simply mapped them inside SysPrefs/Keyboard/Shortcuts 

## Gestures

Thanks to VoodooI2C team I've successfully activated native gestures on my hack. Everything is working except 4-fingers gestures, but who cares -_- 

# IORegistryExplorer dump

I attached a zip file containing my anonymized IORegistryExplorer dump by using [DarwinDumper](https://bitbucket.org/blackosx/darwindumper/downloads/). Every credits for the application goes to the developer.

You can download the dump [here](/Docs/DarwinDumper_ioreg.zip)

Please note that if you're experiencing weird issues with the viewer, try another browser like Safari or Google Chrome

## Issues

If you encounter any issue, please file a bugreport [here](https://github.com/dreamwhite/bugtracker/issues/new?assignees=dreamwhite&labels=bug&template=generic.md&title=)

## Credits

* **Apple** for macOS
* [**Acidanthera**](https://github.com/acidanthera) for OpenCore and the majority of the kexts
* [**RehabMan**](https://github.com/RehabMan) for contributing to most of the ACPI patching guides I used
* [**macOS86 and its staff**](https://github.com/macos86) for helping me hackintoshing this laptop
* [**1alessandro1**](https://github.com/1alessandro1) and [**marianopela**](https://github.com/marianopela) <!-- wamawwo mawwone --> for helping me optimizing this EFI 
* **every other people that contributed to the hackintosh world :haha:**

## Donate

> This smol project is **free**, **open source** and I aim to provide all the necessary support<br>
> Why donate? I spend my spare time to work on this project to provide the best documentation ever. Internet is filled of bullshit and unneeded stuff. **THANK YOU!**

[![](https://img.shields.io/badge/donate-paypal-005EA6.svg?logo=paypal)](https://www.paypal.me/dreamwhitedev) [![](https://img.shields.io/badge/donate-ko--fi-29abe0.svg?logo=ko-fi)](https://ko-fi.com/dreamwhite) ![](https://img.shields.io/badge/ethereum-0xb6AAD058f7FF9b6A27467150aD23Ad9e341cC61d-4E8EE9.svg?logo=ethereum)
