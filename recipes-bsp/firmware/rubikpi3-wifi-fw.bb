SUMMARY = "Broadcom AP6256 (BCM43456 c5) WiFi firmware for Rubik Pi 3"
DESCRIPTION = "Renamed copy of fw_bcm43456c5_ag.bin from rubikpi-ai's \
rubikpi3-firmware package, installed at the path the brcmfmac driver \
requests (brcm/brcmfmac43456-sdio.bin). Also installs the board-specific \
NVRAM (calibration tables) at brcm/brcmfmac43456-sdio.thundercomm,rubikpi3.txt, \
matching the DT compatible string of qcs6490-thundercomm-rubikpi3."

LICENSE = "CLOSED"

SRC_URI = " \
    file://fw_bcm43456c5_ag.bin \
    file://nvram.txt \
"

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware/brcm
    install -m 0644 ${UNPACKDIR}/fw_bcm43456c5_ag.bin \
        ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43456-sdio.bin
    install -m 0644 ${UNPACKDIR}/nvram.txt \
        ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43456-sdio.thundercomm,rubikpi3.txt
}

FILES:${PN} = " \
    ${nonarch_base_libdir}/firmware/brcm/brcmfmac43456-sdio.bin \
    ${nonarch_base_libdir}/firmware/brcm/brcmfmac43456-sdio.thundercomm,rubikpi3.txt \
"

COMPATIBLE_MACHINE = "(qcs6490-thundercomm-rubikpi3)"
