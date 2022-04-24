# Docs: ACPI - SSDT-GPRW

As [Dortania's OpenCore Post Install guide](https://dortania.github.io/OpenCore-Post-Install/usb/misc/instant-wake.html) states:

```
...macOS will instant wake if either USB or power states change while sleeping. To fix this we need to reroute the GPRW/UPRW/LANC calls to a new SSDT...
```

The best way to check if you're having wake issues is running this command and analyzing the output:

```
pmset -g log | grep -e "Sleep.*due to" -e "Wake.*due to"
```

In my case only `GPRW` was needed, so I added:

- [SSDT-GPRW](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/SSDT-GPRW.aml)
- [config.plist/ACPI/Patch](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/GPRW-Patch.plist)

# Credits

- [Dortania](https://github.com/dortania) for their [guide](https://dortania.github.io/OpenCore-Post-Install/usb/misc/instant-wake.html)