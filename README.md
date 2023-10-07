# PSB Status

## What is this?

A repo and script aiming to create a list of AMD Platform Secure Boot (Hardware
Validated Boot) enabled and disabled boards.

Inspired by https://github.com/felixsinger/bootguard-status

## Why?

PSB prevents the user from using their own firmware on (thus taking full
ownership of) their own devices.

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

Users are encouraged to add their devices to the table below. Submit a PR, or
make an issue!

## List

| Model | Status |
| --- | --- |
| Lenovo ThinkPad T14 Gen1 | Fused |
| Lenovo ThinkPad P14s Gen4 | Fused |
| Asus ROG Strix B550-I | Unfused |
