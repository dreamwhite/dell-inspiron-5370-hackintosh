# Enabling Bluetooth support for non-Apple WiFi/BT combo modules

If you have lot of money to waste and you wanna experience an as much as native experience with WiFi/BT on hackintosh, you'll probably opt for a compatible WiFi/BT combo module like the `DW1830`.
This module has a natively working WiFi (with some exceptions like the available bandwidth that differs between each Country Code; for more infos check out [the first boot-arg on this link](https://github.com/acidanthera/airportbrcmfixup/#specific-boot-args-and-ioreg-properties)).

For the Bluetooth however, you'll need a different set of kexts to use.
##### Please note that this list comes from [acidanthera's BrcmPatchRAM repository installation notes](https://github.com/acidanthera/brcmpatchram/#installation) and I'm excluding any macOS version prior to macOS High Sierra 10.13

| Kext / macOS version    | macOS High Sierra 10.13 | macOS Mojave 10.14 | macOS Catalina 10.15 | macOS Big Sur 11 | macOS Monterey 12 |
|-------------------------|-------------------------|--------------------|----------------------|------------------|-------------------|
| `BrcmPatchRAM2`         | ✅                      | ✅                  | ❌                   | ❌                | ❌                |
| `BrcmPatchRAM3`         | ❌                      | ❌                  | ✅                   | ✅                | ✅                |
| `BrcmFirmwareData`      | ✅                      | ✅                  | ✅                   | ✅                | ✅                |
| `BrcmBluetoothInjector` | ❌                      | ❌                  | ✅                   | ✅                | ❌                |
| `BluetoolFixup`         | ❌                      | ❌                  | ❌                   | ❌                | ✅                |

# Credits

- [Acidanthera](https://github.com/acidanthera) for [AirportBrcmFixup](https://github.com/acidanthera/AirportBrcmFixup) and [BrcmPatchRAM](https://github.com/acidanthera/BrcmPatchRAM)
