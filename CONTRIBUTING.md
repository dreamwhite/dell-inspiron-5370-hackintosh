# How do I contribute?

In order to contribute on this repository, open a PR (pull request) and make sure to follow those guidelines:

## Before commiting

I perfectly know this may sound as stupid but avoid exposing sensitive information (such as SMBIOS serial numbers and so on or even personal infos).

## Title

The title should clearly explain what kind of change is proposed and must follow this format: `[file or folder] Brief description`.
Use [Configuration.pdf](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/Configuration.pdf) if needed for more infos

Some examples below:

**Change:** updated `ScanPolicy` in `config.plist` under `Misc/Security` to allow scanning `Linux Data file systems`
**Title:** `[config.plist] Added OC_SCAN_ALLOW_FS_LINUX_DATA bit to ScanPolicy`

**Change:** updated `boot-arg` NVRAM variable in `config.plist` to configure AppleALC layout-id
**Title:** `[config.plist] Added AppleALC layout-id variable to NVRAM`

## Body

The PR body must clearly explain why you're proposing a certain set of changes and must be as documented as possible.
I'll discard PRs that aren't documented.

Some examples below:

1. `As documented in OpenCore's Configuration.pdf, to allow OpenCore scan Linux Data file systems, 0x00002000 bit flag must be added to ScanPolicy value. Hencefore the meaning of this PR`
2. `As explained in AppleALC wiki, to set layout-id add alcid=X boot-arg`


