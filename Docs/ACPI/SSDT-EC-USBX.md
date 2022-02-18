# Docs: ACPI - SSDT-EC-USBX

The meaning of this SSDT is explained pretty easily in [OpenCorePkg documentation](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-EC-USBX.dsl):

```
/*
 * AppleUsbPower compatibility table for Skylake+.
 *
 * Be warned that power supply values can be different
 * for different systems. Depending on the configuration
 * these values must match injected IOKitPersonalities
 * for com.apple.driver.AppleUSBMergeNub. iPad remains
 * being the most reliable device for testing USB port
 * charging support.
 *
 * Try NOT to rename EC0, H_EC, etc. to EC.
 * These devices are incompatible with macOS and may break
 * at any time. AppleACPIEC kext must NOT load on desktops.
 * See the disable code below.
 *
 * While on some laptops, this kext is essential to access EC
 * region for battery status etc. Please ignore EC related
 * patches under the circumstance.
 *
 * Reference USB: https://applelife.ru/posts/550233
 * Reference EC: https://applelife.ru/posts/807985
 */
```

Please note that on my laptop there's a valid EC device called `ECDV` BUT it cannot be disabled, otherwise the laptop won't boot at all.
On this SSDT it's only defined a dummy-EC device and a USBX device without the desktop properties (`kUSBSleepPowerSupply` and `kUSBWakePowerSupply`; overall it's a laptop... you don't say uh?)

# Credits

- [acidanthera](https://github.com/acidanthera) for the [original code](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-EC-USBX.dsl)
- [Gengik84](https://github.com/Gengik84) for teaching me why the desktop values aren't used at all on a laptop