# Add a split-package for the Broadcom BCM4345C5 UART HCI patchram
# (brcm/BCM4345C5.hcd). Used by the AP6256 module on the Thundercomm Rubik
# Pi 3 (and many other AP6256-bearing boards, e.g. Raspberry Pi 4's BCM4345C0
# uses a sibling .hcd). Upstream linux-firmware ships the blob already; this
# bbappend just exposes it as an independently installable package so boards
# don't have to pull in the catch-all linux-firmware to get one 72 KB file.

PACKAGES =+ "${PN}-bcm4345c5"

LICENSE:${PN}-bcm4345c5 = "Firmware-broadcom_bcm43xx"
FILES:${PN}-bcm4345c5   = "${nonarch_base_libdir}/firmware/brcm/BCM4345C5.hcd"
RDEPENDS:${PN}-bcm4345c5 += "${PN}-broadcom-license"
