# Enabling FileVault2 Disk Encryption

## MAMMAMIA MARCELLO WHAT IS IT!? WHAT YOU DOIN?

As [@dortania](https://github.com/dortania) says in its ["How to enable FileVault2" guide](https://dortania.github.io/OpenCore-Post-Install/universal/security/filevault.html):

> FileVault is macOS's builtin drive encryption, and with OpenCore support for it has been drastically improved compared to the legacy Clover drivers.

## ALBERTO COME AND LOOK AT MARCELLO. MAMMAMIA THIS IS HOW YOU ENABLE FILEVAULT 2 WITH OPENCORE!

In order to enable FileVault2 support, I had to edit `config.plist` as it follows:

- `Misc/Boot/PollAppleHotKeys` = `True`
- `UEFI/Input/KeySupport` = `True`
- `UEFI/Output/ProvideConsoleGop` = `True`
- `UEFI/ProtocolOverrides/FirmwareVolume ` = `True`
- `UEFI/Quirks/RequestBootVarRouting` = `True`

With the above settings, I successfully enabled FileVault 2 from `SysPrefs/Security and Privacy/FileVault`.
Please note that the encryption process can take up to several hours depending on the data contained on your SSD.

## Performances

You may notice a lower performance from your machine, but that's pretty normal since your PC encrypts-decrypts the data every time you edit it :p

Anyways, I did a few benchmarks using AmorphousMemoryMark and AmorphousDiskMark and the gap with no-FileVault performances isn't too big at all:

![AmorphousDiskMark](https://i.imgur.com/fMK0Q2E.png)
![AmorphousMemoryMark](https://i.imgur.com/fDPbPB5.png)

# Credits

- [MAMMAMIA MARCELLO original video](https://www.youtube.com/watch?v=ChDof6K--GI) which helped me writing this smol guide
- [Dortania](https://dortania.github.io) for ["How to enable FileVault2" guide](https://dortania.github.io/OpenCore-Post-Install/universal/security/filevault.html)

