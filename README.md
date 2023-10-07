# PSB Status

## What is this?

A repo and script aiming to create a list of AMD Platform Secure Boot (Hardware
Validated Boot) enabled and disabled boards.

Inspired by https://github.com/felixsinger/bootguard-status

## Why?

PSB prevents the user from using their own firmware on (thus taking full
ownership of) their own devices.

As a technology, PSB has considerable security benefits, by rooting trust in
physical one-time fuses inside the CPU itself. However, computer vendors fuse
the processors to their own secret keys, making it impossible for the user to
replace them. If the vendor stops updating your firmware or adds hostile
features such as whitelists, you're out of luck. If a vulnerability is found
and you don't get an official update, you're screwed. If you don't trust the
vendor's firmware, you can't do anything about it.

This list aims to document which devices do or do not allow the user the
freedom to run their own code, allowing users to make informed purchasing
decisions.

## How?

Requirements: [iotools](https://github.com/adurbin/iotools)

```bash
git clone https://github.com/mkopec/psb_status.git
cd psb_status
sudo ./psb_status.sh
```

The script checks bit 24 (`FUSE_PLATFORM_SECURE_BOOT_EN`) of SMN register
`PSB_STATUS_OFFSET`. A value of 1 indicates PSB fused silicon. This is based on
[coreboot's PSB implementation](https://github.com/coreboot/coreboot/blob/17848b65c38c32fa9630925ca8a15203a0617788/src/soc/amd/common/block/psp/psb.c#L105-L111)
which is publically available. This may or may not be valid for your device,
and I can not be responsible if this script causes unexpected behavior for you.
But so far, Renoir, Cezanne and Phoenix based devices have been confirmed to
work.

Users are encouraged to add their devices to the table below. Submit a PR, or
make an issue!

## List

| Model | Status |
| --- | --- |
| Lenovo ThinkPad T14 Gen1 | Enabled |
| Lenovo ThinkPad P14s Gen4 | Enabled |
| Asus Pro WS X570-ACE | Disabled |
| Asus ROG Strix B550-I | Disabled |
| Valve Steam Deck | Disabled |
