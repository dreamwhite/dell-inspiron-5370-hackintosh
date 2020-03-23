---
description: Many devices defined in DSDT aren't used in macOS
---

# Remove unused scopes and devices

## Marcello, what is it?

macOS kexts attaches to some devices that are defined in DSDT. But many of them aren't necessary

## What you doin'?

Removing unused scopes and devices from my hackintosh

## Mammamia Marcello, this is not how to remove unused scopes and devices from hackintosh

What you mean?

## This is how to remove unused scopes and devices from hackintosh

{% hint style="info" %}
**Q:** Can this procedure break my hackintosh?  
**A:** The following procedure is safe your hackintosh. Just fix the ACPI errors.
{% endhint %}

## Requirements

* DSDT.aml
* * [Extracting ACPI tables](../extracting-acpi-tables.md)
* [MaciASL](../../tools/useful-tools/maciasl.md)
* [Mount EFI](../../bootloaders/mount-efi.md)
* [IORegistryExplorer](../../tools/debugging/ioregistryexplorer.md)
* IOReg export from same SMBIOS Mac

### Step 1: identify unused devices

{% hint style="info" %}
Macs from the same family \(e.g. _MacBookPro15,x_ etc\) have a similar IORegistryExplorer structure
{% endhint %}

Open IORegistryExplorer and the previously downloaded same SMBIOS Mac IORegistryExplorer export file.

![e.g. SMBIOS is MacBookPro15,2](../../.gitbook/assets/image-26%20%281%29.png)

Then search for every single device that is in IORegistryExplorer and compare with the same SMBIOS Mac IORegistryExplorer export file.

You should have a result like the depicted below:

![From my hackintosh](https://github.com/mammamiamarcello/mammamia-marcello-vanilla-guides/tree/664b37540b1eb3eddabd08075a7cff9210e60efd/.gitbook/assets/image%20%28100%29.png)

![From a MacBookPro 15,1 ](../../.gitbook/assets/image-32%20%281%29.png)

_AMW0_ doesn't appear in the MacBookPro 15,1 IORegistryExplorer export so just write it down in a list

### Step 2: removing them from DSDT and fixing errors

{% hint style="info" %}
Syntax for MaciASL patches is available [here](https://sourceforge.net/p/maciasl/wiki/Patching%20Syntax%20Grammar/)
{% endhint %}

Open _DSDT.aml_ with MaciASL, clean it from errors and search for each device that you've wrote down previously.

![AMW0 needs to be removed](https://github.com/mammamiamarcello/mammamia-marcello-vanilla-guides/tree/664b37540b1eb3eddabd08075a7cff9210e60efd/.gitbook/assets/image%20%28136%29.png)

{% hint style="info" %}
Note that _AMW0_ path is _**\_SB.AMW0**_
{% endhint %}

Click on patch icon and add the following patch:

```text
into device label AMW0 parent_label _SB remove_entry;
```

_AMW0_ is the device we need to remove, _\_SB_ is the path.

![Click on &quot;Apply&quot; and then &quot;Compile&quot;](../../.gitbook/assets/image-77.png)

![There&apos;s only one error. Click on it and fix it as depicted below](https://github.com/mammamiamarcello/mammamia-marcello-vanilla-guides/tree/664b37540b1eb3eddabd08075a7cff9210e60efd/.gitbook/assets/image%20%28110%29.png)

![There are two AMW0 references](../../.gitbook/assets/image-72.png)

Open again patch menu and apply the following patch

```text
into method label WMNF remove_entry;
```

![Click on &quot;Apply&quot; then &quot;Compile&quot;](https://github.com/mammamiamarcello/mammamia-marcello-vanilla-guides/tree/664b37540b1eb3eddabd08075a7cff9210e60efd/.gitbook/assets/image%20%28111%29.png)

![Another error](../../.gitbook/assets/image-57.png)

Repeat the patching process by using the following syntax:

| Parameter | Value |
| :--- | :--- |
| OBJECT\_TYPE | All\|DefinitionBlock\|Scope\|Method\|Device\|Processor\|ThermalZone |
| LABEL | Object name \(e.g. WMNF\) |
| \[parent\_label PARENT\_LABEL\] | Path for object \(e.g. \_SB.PCI0 etc\) |

```text
into OBJECT_TYPE label [parent_label PARENT_LABEL] remove_entry;
```

After removing the devices click on every error and fix it as depicted below:

![Object does not exist \(EV4\_\)](../../.gitbook/assets/image-46.png)

![Remove the line which contains the removed method](../../.gitbook/assets/image-7%20%281%29.png)

Proceed by fixing other errors in the same way

![Remove the lines which contains the removed method](../../.gitbook/assets/image-92.png)

After cleaning DSDT from errors save it in `ECAP`and reboot.

The new IORegistryExplorer structure should be similar to the same SMBIOS machine.

![No more AMW0 device](../../.gitbook/assets/image-10.png)

