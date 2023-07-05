# BIOS dump

**If you're an NVMe user make sure to disable SATA mode using BIOS GUI, otherwise you may experience issues**

## Manual way

After extracting my bios using [this guide](https://github.com/dreamwhite/bios-extraction-guide/tree/master/Dell) I've applied a few changes about CFG Lock status and DVMT.
If you're interested in BIOS settings, look at [Section\_PE32\_image\_Setup.txt](Inspiron5370_Vostro5370_5471_BIOS_v1_22_0_x64.exe_extracted/Section_PE32_image_Setup.txt)

I've changed the following offsets via `modGRUBShell.efi`:

**PLEASE DOUBLE CHECK THE OFFSETS**

- `Above 4G` to `Disabled` using `setup_var 0x7ED 0x00` (there's no sense of having it enabled, so double check if it's enabled or not)

![Above 4G offset](/.assets/docs/bios/images/above_4g.png)

- `CFG Lock` to `Disabled` using `setup_var 0x527 0x00`

![CFG Lock offset](/.assets/docs/bios/images/cfg_lock.png)

- `CSM Support` to `Disabled` using `setup_var 0x104A 0x00`

![CSM Support offset](/.assets/docs/bios/images/csm_support.png)

- `DVMT Pre-allocated` to `64M` using `setup_var 0x7E8 0x2`

![DVMT Pre-allocated offset](/.assets/docs/bios/images/dvmt_pre_allocated.png)

- `DVMT Total Gfx Mem` to `MAX` using `setup_var 0x7E9 0x3`

![DVMT Total Gfx Mem offset](/.assets/docs/bios/images/dvmt_total_gfx.png)

- `Serial Port` to `Disabled` using `setup_var 0x1272 0x00`

![Serial Port offset](/.assets/docs/bios/images/serial_port.png)

- `SW Guard Extension` to `Disabled` using `setup_var 0x5DC 0x00`

![SW Guard Extension offset](/.assets/docs/bios/images/sgx.png)

- `TPM State` to `Disabled` using `setup_var 0xF7A 0x00`

![TPM State offset](/.assets/docs/bios/images/tpm_state.png)

- `XHCI Hand-off` to `Enabled` using `setup_var_cv UsbSupport 0x1B 0x1 0x01`

![XHCI Hand-off offset](/.assets/docs/bios/images/xhci_handoff.png)

## Automatic way (more or less)

In the `Automatic` folder, there's a UEFI NSH script called `bios.nsh`. Think of it like a `.sh` or a `.bat` script which runs in UEFI shell environment.

What you gotta do is:

1. Take a spare thumb drive
2. Format it in GUID FAT-32 (or MS-DOS FAT if you're in macOS environments)
3. Copy the whole content of the `Automatic` folder and make sure you have the following tree:

```
|── EFI
│   └── BOOT
│       └── BOOTx64.efi
├── bios.nsh
└── setup_var.efi
```

Please note that `BOOTx64.efi` is simply `OpenShell.efi` renamed in order to automatically run from the BIOS boot menu.
Please note that `setup_var.efi` is took from [datasone/setup_var.efi](https://github.com/datasone/setup_var.efi/releases/tag/0.2.2). All credits goes to him for this fantastic tool

4. Locate your thumb drive `FSx:` (usually should be `FS1:`)
5. Run `bios.nsh` and enjoy


# Conclusions

In this way, you won't need more:
- `framebuffer-fbmem` and `framebuffer-stolenmem` properties under `DeviceProperties` for the graphics patch
- `ReleaseUsbOwnership` under `UEFI/Quirks` :) 

