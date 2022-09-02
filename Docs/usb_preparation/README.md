# How to create a bootable USB?

I'm lazy and due to storage issues (I don't see any reason why should I waste 16GB of space for my USB), I only use [macrecovery.py method](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/winblows-install.html#downloading-macos) to download just 700MB of recovery.


The tested versions that I ran on my laptop are from Mojave to Monterey (and Ventura, but that's another story).

Download your favourite one:

```sh
# Mojave (10.14)
python macrecovery.py -b Mac-7BA5B2DFE22DDD8C -m 00000000000KXPG00 download

# Catalina (10.15)
python macrecovery.py -b Mac-00BE6ED71E35EB86 -m 00000000000000000 download

# Big Sur (11)
python macrecovery.py -b Mac-42FD25EABCABB274 -m 00000000000000000 download

# Latest version
# ie. Monterey (12)
python ./macrecovery.py -b Mac-E43C1C25D4880AD6 -m 00000000000000000 download
```

# Credits

- [dortania](https://github.com/dortania) for this [guide](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/winblows-install.html#downloading-macos)