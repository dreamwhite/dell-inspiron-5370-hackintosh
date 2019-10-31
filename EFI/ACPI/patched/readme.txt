Contents of this folder:
    - DSDT.aml
    - SSDT-ALC256.aml
    - SSDT-BRT6.aml
    - SSDT-PNLF.aml
    - SSDT-XOSI.aml

Why of those files?

- DSDT.aml
    
    Basic patches:
    	
	- Fix _WAK Arg0 v2
	- Fix Mutex with non-zero SyncLevel
	- HPET fix
	- IRQ Fix
	- RTC Fix

- SSDT-ALC256.aml
	
    To use with CodecCommander.kext in /EFI/CLOVER/kexts/Other + hda-verb in /usr/bin

    Fixes the jack headphones crackling when connected
    Before this SSDT I used "hda-verb 0x19 0x707 0x20" but this was a temporary fix

- SSDT-BRT6.aml

    Maps the FN keys for Dell with FN+F11 and FN+F12 with Brightness_Down and Brightness_Up

- SSDT-PNLF.aml
    
    Enables brightness control via System Preferences => Monitor

- SSDT-XOSI.aml

    Read SSDT-BRT6.aml
    Read config.plist.readme.txt
