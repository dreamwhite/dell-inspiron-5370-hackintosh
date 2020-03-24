# USBInjectAll

## Marcello, what is it?

In 10.11+ Apple has changed significantly the way the USB drivers work. In the absense of a port injector, the drivers use ACPI to obtain information about which ports are active. Often, this information is wrong. Instead of correcting the DSDT, a port injector can be used \(just as Apple did for their own computers\). But in order to create such an injector, you must first determine which ports are actually being used. And to do that you need to inject all ports so you can test all ports on the computer to determine which ones correspond to each available port address. You can't test a port that is disabled...

That's where this kext comes in.

{% hint style="info" %}
The injector in this case is the ACPI table which defines the ports. Usually it's called SSDT-X-xxxyy.aml
{% endhint %}

This kext attempts to inject all ports for each controller, and for hubs as well. You can use this kext \(temporarily\) to enable all ports so you can determine which ports really need to be in the final injector. Only the \(potential\) hub on EH01.PRT1 and EH02.PRT1 are injected. Other hubs would require modifications. So far, I haven't seen internal hubs connected to other ports. The kext automatically determines the ports \(and their addresses\) based on the specifc USB controller chipsets.

EH01: 8-USB2 ports PR11-PR18.

EH02: 6-USB2 ports PR21-PR28.

EH01 hub: 8-USB2 ports HP11-HP18.

EH02 hub: 8-USB2 ports HP21-HP28.

XHC, 7-series chipset \(8086:1e31\): 4-USB2 ports HS01-HS04, 4-USB3 ports SS01-SS04.

XHC, 8/9-series chipset \(8086:9xxx\): 9-USB2 ports HS01-HS09, 6-USB3 ports SS01-SS06.

XHC, 8/9-series chipset \(8086:8xxx\): 14-USB2 ports HS01-HS14, 6-USB3 ports SS01-SS06.

XHC, 8/9-series chipset \(8086:9cb1\): 11-USB ports HS01-HS11, 4-USB3 ports SS01-SS04.

XHC, 100-series chipset \(8086:a12f\): 14-USB2 ports HS01-HS14, 10-USB3 ports SS01-SS10, plus USR1/USR2\)

XHC, 100-series chipset \(8086:9d2f\): 10-USB2 ports HS01-HS10, 6-USB3 ports SS01-SS06, plus USR1/USR2\)

XHC, 200-series/300-series chipset, etc.

This kext is only for 10.11+. It has no use with prior versions.

Currently, only Intel controllers are supported. The most commonly used SMBIOS model identifiers are in the kext.

## Download link

* [GitHub](https://github.com/Sniki/OS-X-USB-Inject-All/releases)

## Credits

* RehabMan for initial contribution
* [USBInjectAll GitHub repo](https://github.com/RehabMan/OS-X-USB-Inject-All) Rehabman
* [USBInjectAll Github repo](https://github.com/Sniki/OS-X-USB-Inject-All/) Sniki

