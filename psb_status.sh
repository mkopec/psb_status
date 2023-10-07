#!/bin/bash
# A script to check Platform Secure Boot enablement on Zen based AMD CPUs

SMN_PUBLIC_BASE=0x3800000
PSB_STATUS_OFFSET=0x10994

smn_read32 () {
		iotools pci_write32 0 0 0 0xB8 $1
		iotools pci_read32 0 0 0 0xBC
}

if ! command -v iotools &> /dev/null
then
    echo "iotools could not be found. Install iotools before executing psb_status.sh."
    exit 1
fi

psb_status=$(smn_read32 $(($SMN_PUBLIC_BASE + $PSB_STATUS_OFFSET)))
psb_enabled=$(iotools and $psb_status 0x1000000)

if [[ "$psb_enabled" != "0x0" ]]; then
		echo "PSB is enabled on your platform. You will not be able to run alternative firmware."
else
		echo "PSB is not enabled on your platform. You may be able to run custom firmware!"
fi
