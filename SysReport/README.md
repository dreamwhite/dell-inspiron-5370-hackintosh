# Fixing buggy MAT Support

## Problem

If you open [opencore-2020-12-07-173231.txt](/SysReport/opencore-2020-12-07-173231.txt) and look for `OCABC: MAT support` you'll see that this laptop has MAT Support. 

According to [OpenCore Configuration.pdf](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/Configuration.pdf), I had to edit `config.plist/Booter/Quirks` as it follows:

- `EnableWriteUnprotector` set to `False`
- `RebuildAppleMemoryMap` set to `True`
- `SyncRuntimePermissions ` set to `True`

Trying to to boot the laptop with the above quirks resulted in being stucked on `[EB|#LOG:EXITBS:START]`.<br>
This is due to the buggy firmware that this laptop has.


## Solution

In order to fix this strange bug, I had to edit `config.plist` as it follows:

- `Booter/Quirks/DevirtualiseMmio` = `True`
- `Booter/Quirks/EnableWriteUnprotector` = `True`
- `Booter/Quirks/RebuildAppleMemoryMap` = `False`
- `Booter/Quirks/SyncRuntimePermissions ` = `False`
- `Misc/Debug/Target` = `67`

With the above settings, I couldn't reach the OS, but I got the `opencore-YYYY-MM-DD-hhmmss.txt` which contained useful infos about MMIO Regions.

Below, the regions I extracted from the above file after looking for `MMIO`:

```
74:890 00:077 OCABC: MMIO devirt start
74:967 00:077 OCABC: MMIO devirt 0xE0000000 (0x10000 pages, 0x8000000000000000) skip 0
75:042 00:074 OCABC: MMIO devirt 0xFE000000 (0x11 pages, 0x8000000000000001) skip 0
75:118 00:075 OCABC: MMIO devirt 0xFEC00000 (0x1 pages, 0x8000000000000001) skip 0
75:195 00:077 OCABC: MMIO devirt 0xFEE00000 (0x1 pages, 0x800000000000100D) skip 0
75:273 00:077 OCABC: MMIO devirt 0xFF000000 (0x1000 pages, 0x800000000000100D) skip 1
75:348 00:074 OCABC: MMIO devirt end, saved 262220 KB
```

What I did is explained in [this dortania's guide](https://dortania.github.io/OpenCore-Install-Guide/extras/kaslr-fix.html#using-devirtualisemmio).<br>
After doing so, I got the right region to add in `config.plist/Booter/MmioWhitelist`
: `0xFF000000`.

Doing this, granted me boot the laptop with the following `config.plist` edits:

- `Booter/Quirks/DevirtualiseMmio` set to `True`
- `Booter/Quirks/EnableWriteUnprotector` set to `False`
- `Booter/Quirks/RebuildAppleMemoryMap` set to `True`
- `Booter/Quirks/SyncRuntimePermissions ` set to `True`
- `Booter/MmioWhitelist/0` set to:
	- `Address` = `4278190080`
	- `Comment` = `MMIO Devirt 0xFF000000`
	- `Enabled` = `True`

# Credits

- [Dortania](https://dortania.github.io) for [KASLR Fix](https://dortania.github.io/OpenCore-Install-Guide/extras/kaslr-fix.html#using-devirtualisemmio) using `DevirtualiseMmio/MmioWhitelist`

