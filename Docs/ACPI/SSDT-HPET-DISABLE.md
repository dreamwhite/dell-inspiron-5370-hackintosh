# Docs: ACPI - SSDT-HPET-DISABLE

Despite this SSDT isn't necessary at all, original MacBookPro15,2 don't have HPET device enabled.
With this SSDT we simply disable it.

How? 

Let's give a look at HPET device definition:

```
        Device (HPET)
        {
            Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (BUF0, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0xFED00000,         // Address Base
                    0x00000400,         // Address Length
                    _Y31)
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (HPTE)
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                If (HPTE)
                {
                    CreateDWordField (BUF0, \_SB.PCI0.LPCB.HPET._Y31._BAS, HPT0)  // _BAS: Base Address
                    HPT0 = HPTB /* \HPTB */
                }

                Return (BUF0) /* \_SB_.PCI0.LPCB.HPET.BUF0 */
            }
        }
```

Here we gotta check `Method (_STA, 0 NotSerialized)`:

```
Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (HPTE)
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
```

By simply setting `HPTE` to `Zero`, we're sure that the `_STA` method will return Zero, thus HPET device will be disabled.

# Credits

- me for banging my head for 69420 hours on ACPI manual
