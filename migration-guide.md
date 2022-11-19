# Migration guide v2

Follow these steps... don't come **_bitching_** if you didn't do them in the correct order. (And don't be creative... Well you can be after you make it work with this recipe).

_- IronManJFF (circa. 2020)._

## Table of contents

- [Disclaimers](#disclaimers)
- [Backing-up](#backing-up)
  - [BIOS Firmware](#backing-up/bios)
  - [Personal Data](#backing-up/data)
- [Retrieve system info](#system-info)
- [MigrationKit](#migration-kit-download) 
- [Configuration & Usage](#config-and-use)
- [Special Topics](#special-topics)
- [Troubleshooting](#troubleshooting)
- [Upgrade existing installation](#upgrade-oc)

## 0. <a id="disclaimers"></a> Disclaimers

_We're so nice, we're gonna say it twice:_

- This guide and any tools provided are intended for use with **QUO** (Z77MX-QUO-AOS) motherboard, and _will_ 100% fail on any other board.

- It is not tested running iGPU only so take note.

- It is not tested it with any other SMBIOS than iMac13,2.

- It is not tested with 'FileVault' drives or Fusion drives.

## 1. <a id="backing-up"></a> Backing-up

1.1 <a id="backing-up/bios"></a> Back-up your current BIOS firmware and settings using the Q-Flash utility in the BIOS.

- Using Q-Flash, select `Save BIOS to ROM`, and save to an external USB device for extra safety.

1.2. <a id="backing-up/data"></a> Back-up your personal information, we are not accountable for any lost data due to bricking your board, or a bad installation by not following the guide correctly. Here are some recommendations:

- Small amount of data: manually make copies of your desired documents to an external drive or cloud service.

- Average amount of data **[recommended]**: create a system backup to a dedicated drive using the macOS Time Capsule utility.

- Mass amount of data: sometimes backing up locally is not an option unless you have a large NAS, in that case I recommend an online service such as [Backblaze Personal Backup](https://www.backblaze.com/cloud-backup.html).

## 2. <a id="system-info"></a> Retrieve system info

Next step is retrieving your system's information (this is assuming you already have a working Hackintosh installation, if not, you can use a tool such as clover config. to generate these details).

For this process use the [HackinTool](https://github.com/headkaze/Hackintool) utility. You will need to find the following:

- Board Serial Number
- ROM (_Can be your network card's MAC Address_)
- Model Identifier (_e.c. iMac13,2_)
- Serial Number
- System ID

## 3. <a id="migration-kit-download"></a> Migration Kit

Download the latest version of the Migration Kit [here](https://github.com/Kazbah/Z77MX-QUO-AOS-OpenCore-Migration-Kit/releases), kindly created and maintained by [IronManJFF](https://github.com/Kazbah).

## 4. <a id="config-and-use"></a> Configuration & Usage

1. Once downloaded the Migration Kit, head into the directory and open the `PlatformInfo.plist` using XCode or your favorite .plist editor.

![Open .plist file in XCode](https://i.postimg.cc/QtMyds2t/1.png)

2. Fill in the system info you retrieved from [step 3](#system-info) in the Generic Section (_don't touch anything else_).

![Fill in system info](https://i.postimg.cc/rsBnj4K0/2.png)

3. Save the file and create a backup, with the name `MyPlatformInfo.plist` somewhere outside of the Migration Kit directory.

4. Open a terminal instance at the Migration Kit location as working directory.

![Terminal instance](https://i.postimg.cc/fRNZTtBR/3.png)

5. Now run the CreateConfig.sh script.
   It will merge the `config_template.plist` with `PlatformInfo.plist` you have just modified, and create a `config.plist` file in the `OC folder`. You run the script by executing this command in the Terminal Window:

   `./CreateConfig.sh`

6.  Open your EFI folder from your boot drive using a tool such as [ESP Mounter Pro](https://www.insanelymac.com/forum/files/file/566-esp-mounter-pro/) or [EFI Mounter](https://www.tonymacx86.com/resources/efi-mounter-v3-1.447/).

7. Time to copy the stuff over!

![Copy folders over](https://i.postimg.cc/HWFdRPM5/4.png)

8. Time to flash the OC-friendly firmware, copy the provided ROM from the Migration Kit to a USB drive. Reboot and flash the new firmware.

![ROM file](https://i.postimg.cc/59XfPMXb/5.png)

9. If all goes well when it reboots, you will see the original QUO Boot logo, then you will be greeted with a familiar BootPicker screen, kinda like when you hold Option on a real Mac (to see reset NVRAM, Recovery HD, or access the UEFI Shell from this screen simply press the `spacebar` on your keyboard).

10. Choose which OS to boot and enjoy!

## 5. <a id="special-topics"></a> Special Topics

This section is reserved for frequent questions, tips, and general info. Kinda messy ATM, might be improved later on...

### 5.1. _What is the OC-friendly firmware?_

The OC-friendly firmware basically is a stripped and patched version of the original H20-XMAS firmware, with the following steps:

- Stripped of Ozmosis, FakeSMC, HFS, APFSDriverLoader, VoodooHDA and anything OZ specific while retaining the DSDT that made it special.

- Reverted back the QUO Boot Logo from the original firmware (F3A) (_this was the only way I found to fix black screen on cold boot_).

- Set Optimized Defaults values to be OC-friendly.

### 5.2. _Access UEFI Shell without OpenCore?_

you can access the UEFI Shell if you cant boot to OS or any other reason, by holding (_or spamming_) the F12 key (_nothing new_).

### 5.3. _How do I set default boot drive?_

OpenCore honors the `Startup Disk` in system settings on macOS.

### 5.4. _How do I boot Windows (UEFI)?_

For this you have 2 options:

- From the OpenCore BootPicker **[recommended]**.
- From the motherboard BootPicker (_hold or spam press F12 while booting_).

### 5.5. _Can I run my system headless (HD4000)?_

Yes, in the BIOS firmware settings, set `iGPU` to enabled, and `Init Display first` PEG, and that's it! (_this will not work with SMBIOS MacMini_).

Make sure you have a working setup before enabling this feature.

### 5.6. _Does virtualization work? (Virtual machines, docker, etc.)_

Yes, the setting is off by default due to some people may be using a Sandy Bridge or Pentium CPU. To enable the feature:

- Head to the BIOS settings, and set Intel Virtualization Technology to `enabled`.

### 5.7. _Can I disable the BootPicker?_

Yes, set ShowPicker key to `false` in the config.plist of your EFI > OC Folder partition (_you can still make it show by holding Option at boot_).

### 5.8. _Can I disable the boot chime?_

Yes, set AudioSupport key to `false` in config.plist of your EFI > OC Folder partition (_but where's the fun in that?_).

## 6. <a id="troubleshooting"></a> Troubleshooting

To retrieve Debug log from Terminal run this command:

`nvram 4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102:boot-log | awk '{gsub(/%0d%0a%00/,"");gsub(/%0d%0a/,"\n")}1'`

![Troubleshooting section](https://i.postimg.cc/3JpYTCjq/6.png)


## 7. <a id="upgrade-oc"></a> Upgrade existing installation

- Backup your EFI folder (_just in case_).

- Download the [latest](https://github.com/Kazbah/Z77MX-QUO-AOS-OpenCore-Migration-Kit/releases) version of the Migration Kit.

- Remember that MyPlatformInfo.plist that you saved somewhere safe earlier? Copy it into the new Migration Kit folder, and redo steps 8 through 10 (_the script will detect that MyPlatformInfo.plist is present and use it instead of PlatformInfo.plist to do the merge_).

- That's it, enjoy!

---

## Support

For support, join the _"official"_ forum topic on [InsanelyMac](https://www.insanelymac.com/forum/topic/343145-guide-z77mx-quo-aos-migrating-from-ozmosis-to-opencore/), But please try it on your own first, who knows, you might learn something!

[url=https://postimg.cc/bGKT6XNc][img]https://i.postimg.cc/bGKT6XNc/1.png[/img][/url]

[url=https://postimg.cc/7JNnYf1w][img]https://i.postimg.cc/7JNnYf1w/2.png[/img][/url]

[url=https://postimg.cc/zV04xfss][img]https://i.postimg.cc/zV04xfss/3.png[/img][/url]

[url=https://postimg.cc/V59xbgDL][img]https://i.postimg.cc/V59xbgDL/4.png[/img][/url]

[url=https://postimg.cc/G9102VP5][img]https://i.postimg.cc/G9102VP5/5.png[/img][/url]

[url=https://postimg.cc/crsV73b7][img]https://i.postimg.cc/crsV73b7/6.png[/img][/url]


