# Headphones issue

**Please note that the following procedure doesn't require disabled SIP as it installs the executable inside `/usr/local/bin` :")**

## Problem

Due to a combojack (microphone with headphones combined jack) in this laptop, if you connect a pair of headphones, it can happen that you'll hear a crackling sound coming from the jack.

## Solution

Extract your sound card codec dump (e.g. use `HdaCodecDump.efi` OpenCore tool) and write down `Pin-ctls` of `Mic Line-In`.<br>
You'll need them for editing the configuration file of `ALCPlugFix Swift`.

In my case I have the following `Pin-ctls`:

- `0x19` has `Pin-Ctls 0x24`
- `0x1a` has `Pin-Ctls 0x20`

**Please note that starting from AppleALC 1.5.5+, you'll need the boot-arg `alcverbs=1` in order for `ALCPlugFix-Swift` to work.**

At this point, download the [latest release of AppleALC](https://github.com/acidanthera/AppleALC/releases/latest), open a terminal window and drag `alc-verb` executable and complete the command as follows:

`alc-verb 0x(pin_complex_number) 0x707 0x(headphones pin-ctls)`

In my case:

- `alc-verb 0x19 0x707 0x24`
- `alc-verb 0x1a 0x707 0x20`


If the above commands fixed the crackling sound coming from the combojack, edit `alcplugfix_config.plist` as depicted below:

![ALCPlugFix-Swift config](https://i.imgur.com/EofWR5N.png)

Finally, you'll have to install a daemon called [ALCPlugFix Swift](https://github.com/black-dragon74/ALCPlugFix-Swift). Follow the install instructions on the repo, and be sure to drag `alcplugfix_config.plist`.

**P.S. place your `alcplugfix_config.plist` into a secure place that you'll never delete/forget, like a dotfile in your `Users` directory**

After rebooting your computer, you'll have a working audio combojack :")
