# Docs: ACPI - SSDT-MCHC-SBUS

As Dortania's Post Install guide says:

```
... What is AppleSMBus? Well this mainly handles the System Management Bus, which has many functions like:

    AppleSMBusController
        Aids with correct temperature, fan, voltage, ICH, etc readings
    AppleSMBusPCI
        Same idea as AppleSMBusController except for low bandwidth PCI devices
    Memory Reporting
        Aids in proper memory reporting and can aid in getting better kernel panic details if memory related

```
For install purposes, this SSDT isn't needed but for post-install it's recommended to put the final touches on your hack.

I decided to add it despite not actually needed. God forgive me for being a cbjp.

# Credits

- [Acidanthera](https://github.com/Acidanthera) for [SSDT-MCHC-SBUS sample SSDT](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-SBUS-MCHC.dsl)
- [Dortania](https://github.com/dortania) for [SSDT-MCHC-SBUS guide](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html)