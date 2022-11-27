
---
### [choco://rweverything.install](choco://rweverything.install)
To use choco:// protocol URLs, install [(unofficial) choco:// Protocol support ](https://community.chocolatey.org/packages/choco-protocol-support)

---

RWEverything can access almost all computer hardware, including PCI (PCI Express), PCI Index/Data, Memory, Memory Index/Data, I/O Space, I/O Index/Data, Super I/O, Clock Generator, DIMM SPD, SMBus Device, CPU MSR Registers, ATA/ATAPI Identify Data, Disk Read Write, ACPI Tables Dump (include AML decode), Embedded Controller, USB Information, SMBIOS Structures, PCI Option ROMs, MP Configuration Table, E820, EDID and Remote Access. A Command Window is provided to access hardware manually.

Powerful utility for hardware engineers, firmware (BIOS) engineers, driver developers, QA engineers, performance test engineers, diagnostic engineers, etc.

![RWEverything Screenshot](https://cdn.jsdelivr.net/gh/brogers5/chocolatey-package-rweverything.install@0a3847839fad160f2403e1aa683f040120b6b9c2/Screenshot.png)

### **NOTE**: RWEverything comes with ABSOLUTELY NO WARRANTY. As it allows you to modify hardware settings, this may damage your system if something goes wrong. Use at your own risk!

---

## **PACKAGE NOTES**

The installer executed by this package was built using Inno Setup. For advanced setup scenarios, refer to [Inno Setup's command-line interface documentation](https://jrsoftware.org/ishelp/index.php?topic=setupcmdline). Any desired arguments can be appended to (or optionally overriding with the `--override-arguments` switch) the package's default install arguments with the `--install-arguments` option.

Installer-specific details (e.g. Setup configuration and supported Languages, Components, and Tasks) can be found in the Inno Setup Script file, which has been extracted using [Inno Setup Unpacker](https://community.chocolatey.org/packages/innounp) and reuploaded for quick reference:
* [32-bit installer](https://github.com/brogers5/chocolatey-package-rweverything.install/tree/v1.7.0.20220602/install_script_x86.iss)
* [64-bit installer](https://github.com/brogers5/chocolatey-package-rweverything.install/tree/v1.7.0.20220602/install_script_x64.iss)

For future upgrade operations, consider opting into Chocolatey's `useRememberedArgumentsForUpgrades` feature to avoid having to pass the same arguments with each upgrade:
```
choco feature enable --name=useRememberedArgumentsForUpgrades
```
