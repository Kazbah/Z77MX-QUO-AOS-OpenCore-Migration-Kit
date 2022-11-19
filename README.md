# Z77MX-QUO-AOS: OpenCore Migration Kit

This project was originally intended to help with the migration from OZ to better maintained and more extensive OpenCore bootloader utility, for the small community of users who use the QUO any os motherboard.

It's new intention is to maintain and continue updating to the latest compatible version of OpenCore for the same user base.

Our latest version is based on [OpenCore 0.8.6](https://github.com/acidanthera/OpenCorePkg/releases/tag/0.8.6)

**_Get started with the [migration-guide](./migration-guide.md)_.**



## Kexts

- 🧩 Lilu 1.6.0 _(kernel patching tool)_
- 🔊 AppleALC 1.7.1 _(native macOS HD audio kernel extension)_
- 🪪 VirtualSMC 1.2.9 _(advanced Apple SMC emulator for kernel)_
- 🖥️ WhateverGreen 1.5.8 _(GPU selector kernel extension for macOS)

## Disclaimers

- This guide and any tools provided are intended for use with **QUO** (Z77MX-QUO-AOS) motherboard, and _will_ 100% fail on any other board.

- It is not tested running iGPU only so take note.

- It is not tested it with any other SMBIOS than iMac13,2.

- I have not tested 'FileVault' drives or Fusion drives.

## Support

For support, join the _"official"_ forum topic on [InsanelyMac](https://www.insanelymac.com/forum/topic/343145-guide-z77mx-quo-aos-migrating-from-ozmosis-to-opencore/), But please try it on your own first, who knows, you might learn something!

Further instructions are in the [migration-guide](./migration-guide.md) file.
