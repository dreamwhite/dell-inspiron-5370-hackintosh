# Docs: ACPI - SSDT-GPI0

The meaning of this SSDT is pretty easy: enabling the device called `GPI0`.

Q: Why do we want this?
A: Without enabling this device, the trackpad won't work properly (at least that's what VoodooI2C official guide states...)

Q: How can we accomplish this?
A: Let's give a look at GPI0 device in our DSDT.aml


```
Device (GPI0)
        {
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                //Bunch of code that it's useless for our scopes
            }

            Name (LINK, "\\_SB.PCI0.GPI0")
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
               //Bunch of code that it's useless for our scopes
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((SBRG == Zero))
                {
                    Return (Zero)
                }

                If ((GPEN == Zero))
                {
                    Return (Zero)
                }

                Return (0x0F)
            }
        }
```

What we actually need to focus on is `Method (_STA, 0, NotSerialized)`. This method basically follows this pseudo code:

```
if sbrg = zero, return zero
if gpen = zero, return zero
otherwise enable the device
```

After a deep investigation with the VoodooI2C team, we found out that the only needed variables that must be changed are `GPEN` and `SDM0`.

Q: But where does `SDM0` comes from?
A: Let's give a look at our `TPD0` (trackpad) device, more specifically to the `_CRS` method

```
Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If ((OSYS < 0x07DC))
                {
                    Return (SBFI) /* \_SB_.PCI0.I2C0.TPD0.SBFI */
                }

                If ((SDM0 == Zero))
                {
                    Return (ConcatenateResTemplate (SBFB, SBFG))
                }

                Return (ConcatenateResTemplate (SBFB, SBFI))
            }
```

`SBFG` definition is the following:

```
Name (SBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, Exclusive, PullUp, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x001B
                    }
            })
```

This is a GPI0 Interrupt ResourceTemplate, so we must make sure that the trackpad works in interrupt mode, rather than polling.

Q: What's the difference between polling and interrupt?
A: Polling basically means that your CPU at a certain frequency (called polling rate) checks the status of the trackpad and then sends the signals to interact with it (e.g. pressing a button or whatever). Interrupt means that the trackpad device itself communicates with the CPU when needed. The main advantages of having the trackpad in interrupt mode? Lower CPU usage

# Credits

- [VoodooI2C team](https://github.com/VoodooI2C) for their fantastic [GPIO pinning guide](https://voodooi2c.github.io/#GPIO%20Pinning/GPIO%20Pinning)