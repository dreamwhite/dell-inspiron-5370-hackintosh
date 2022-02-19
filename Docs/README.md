# Mammamia Marcello what are ACPIs?

As [Dortania's Getting Started with ACPI PR #54](https://github.com/dortania/OpenCore-Post-Install/pull/54) by [@1alessandro](https://github.com/1alessandro1) guide states:

---

So what are DSDTs and SSDTs? Well, these are tables present in your firmware that outline hardware devices like USB controllers, CPU threads, embedded controllers, system clocks and such. A DSDT (Differentiated System Description Table) can be seen as the body holding most of the info with smaller bits of info being passed by the SSDT (Secondary System Description Table). You can think of the DSDT as the building blueprints with SSDTs being sticky notes outlining extra details to the project

You can read more about ACPI and it's spec here: [ACPI 6.4 Manual](https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf)

    So why do we care about these tables?

macOS can be very picky about the devices present in the DSDT and so our job is to correct it. The main devices that need to be corrected for macOS to work properly:

- Embedded controllers(EC)

    All semi-modern Intel machines have an EC (usually called H_EC, ECDV, EC0, etc...) exposed in their DSDT, with many AMD systems also having it exposed. These controllers are generally not compatible with macOS and can cause panics, so then need to be hidden from macOS. macOS Catalina requires a device named EC to be present though, so a dummy EC is created.
    
    With laptops, the actual embedded controller still needs to be enabled for battery and hotkeys to work, and renaming the EC can additionally cause issues with windows, so creating a fake EC without disabling the real embedded controller is preferable.


    Plugin type
        This allows the use of XCPM providing native CPU power management on Intel Haswell and newer CPUs, the SSDT will connect to the first thread of the CPU. Not meant for AMD
    AWAC system clock.
        This applies to all 300 series motherboards including many Z370 boards, the specific issue is that newer boards ship with AWAC clock enabled. This is a problem because macOS cannot communicate with AWAC clocks, so this requires us to either force on the legacy RTC clock or if unavailable create a fake one for macOS to play with
    NVRAM SSDT
        True 300 series motherboards(non-Z370) don't declare the FW chip as MMIO in ACPI and so the kernel ignores the MMIO region declared by the UEFI memory map. This SSDT brings back NVRAM support
    Backlight SSDT
        Used for fixing backlight control support on laptops
    GPIO SSDT
        Used for creating a stub to allow VoodooI2C to connect onto, for laptops only
    XOSI SSDT
        Used for rerouting OSI calls to this SSDT, mainly used for tricking our hardware into thinking its booting Windows so we get better trackpad support. This is a very hacky solution known for breaking Windows boot, use the GPIO SSDT instead. Usage of XOSI will not be covered in this guide
    IRQ SSDT and ACPI patches
        Needed for fixing IRQ conflicts within the DSDT, for laptops mainly. SSDTTime exclusive
        Note Skylake and newer systems rarely have IRQ conflicts, this is mainly prevalent on Broadwell and older

# SSDT

| SSDT | Function |
| ---- | -------- |
| [`SSDT-3-xh_OEMBD`](ACPI/SSDT-3-xh_OEMBD.md) | OEM USB SSDT customized for enabling just the necessary USB ports |
| [`SSDT-EC-USBX`](ACPI/SSDT-EC-USBX.md) | Used for disabling your real Embedded controller and creating a fake one for macOS to play with ; USBX portion is used for injection USB power properties missing on Skylake and newer |
| [`SSDT-GPI0`](ACPI/SSDT-GPI0.md) | Used for enabling GPI0 controller for trackpad. Paired with `SSDT-TPD0` |
| [`SSDT-GPRW`](ACPI/SSDT-GPRW.md) | Used for fixing sleep problems - Requires `GPRW to XPRW` patch in `ACPI > Patch` |
| [`SSDT-HPET-DISABLE`](ACPI/SSDT-HPET-DISABLE.md) | Used for disabling HPET device on macOS |
| [`SSDT-MCHC-SBUS`](ACPI/SSDT-MCHC-SBUS.md) | Used for fixing SMBus support on macOS |
| [`SSDT-PLUG`](ACPI/SSDT-PLUG.md) | Used for enabling Apple's XCPM in macOS, allowing for far better CPU power management |
| [`SSDT-PNLF`](ACPI/SSDT-PNLF.md) | Used for controlling the backlight on internal display |
| [`SSDT-PS2K`](ACPI/SSDT-PS2K.md) | Used for binding some keys like `Stamp to F13` and disabling `Swap command and option` |
| [`SSDT-TPD0`](ACPI/SSDT-TPD0.md) | Way better alternative to `SSDT-XOSI` to force the trackpad behave like on Windows 8 - [infos](https://docs.microsoft.com/en-us/windows-hardware/drivers/acpi/winacpi-osi) |

# Benchmarks

The following benchmarks were made using Geekbench V5:

- [CPU Single-core and Multi-core](https://browser.geekbench.com/v5/cpu/2830516)
- [GPU Metal](https://browser.geekbench.com/v5/compute/1173808)
- [GPU OpenCL](https://browser.geekbench.com/v5/compute/1173815)

### SSD

![SSD Western Digital SN750 Black NVMe 512GB BlackMagic Disk Speed Test](/.assets/docs/benchmarks/ssd/images/Blackmagic.png)
![SSD Sabrent Rocket NVMe 3.0 512GB AmorphousDiskMark](/.assets/docs/benchmarks/ssd/images/AmorphousDiskMark.png)

### RAM

![16GB DDR4 @ 2400MHz AmorphousMemoryMark](/.assets/docs/benchmarks/ram/images/AmorphousMemoryMark.png)

## VideoProc Hardware Infos

![Hardware Info detected by VideoProc](/.assets/docs/benchmarks/videoproc/images/VideoProc.png)