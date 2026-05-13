SUMMARY = "Broadcom BCM4345C5 Bluetooth controller patchram (.hcd)"
DESCRIPTION = "Firmware patchram for the AP6256 module's BCM4345C5 BT \
controller on the Thundercomm Rubik Pi 3. Loaded by drivers/bluetooth/ \
hci_bcm.c via the brcm,bcm4345c5 DT compatible already present in mainline \
qcs6490-thundercomm-rubikpi3.dts. 72020 bytes, sourced from \
rubikpi-ai/rubikpi3-firmware."

LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

SRC_URI = "file://BCM4345C5.hcd"

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware/brcm
    install -m 0644 ${UNPACKDIR}/BCM4345C5.hcd \
        ${D}${nonarch_base_libdir}/firmware/brcm/BCM4345C5.hcd
}

FILES:${PN} = "${nonarch_base_libdir}/firmware/brcm/BCM4345C5.hcd"
COMPATIBLE_MACHINE = "(qcs6490-thundercomm-rubikpi3)"
