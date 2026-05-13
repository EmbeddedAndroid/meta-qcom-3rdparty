SUMMARY = "Renesas uPD720201 USB 3.0 host controller firmware"
DESCRIPTION = "Firmware blob for the Renesas uPD720201 USB 3.0 host \
controller, as found on the Thundercomm Rubik Pi 3 (PCIe 0000:01:00.0). \
Without this blob the chip's xhci-pci-renesas driver fails to probe and \
the AX88179B / CDC NCM ethernet adapter behind the controller never \
enumerates. Extracted from Thundercomm's FlatBuild release image \
(usb_fw.img ext2 filesystem)."

LICENSE = "CLOSED"

SRC_URI = "file://renesas_usb_fw.mem"

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware
    install -m 0644 ${UNPACKDIR}/renesas_usb_fw.mem \
        ${D}${nonarch_base_libdir}/firmware/renesas_usb_fw.mem
}

FILES:${PN} = "${nonarch_base_libdir}/firmware/renesas_usb_fw.mem"

COMPATIBLE_MACHINE = "(qcs6490-thundercomm-rubikpi3)"
