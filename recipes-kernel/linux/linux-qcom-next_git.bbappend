# tag: qcom-next-7.0-rc2-20260306
LINUX_VERSION:uno-q = "6.19+7.0-rc2"
SRCREV:uno-q = "a656209cfb5a49f301c377aa8455a10f83a4a719"

FILESEXTRAPATHS:prepend:radxa-dragon-q6a := "${THISDIR}/radxa-dragon-q6a:"

SRC_URI:append:radxa-dragon-q6a = " \
			file://realtek-eth-8169.cfg \
"

# LOCAL-ONLY: Rubik Pi 3 patches not yet in qcom-next.
#   e8bd92c4a0d2 drm/bridge: lt9611: Add support for single Port B input
#   ebcf2240a249 arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI Port B
#   draft        arm64: dts: qcom: qcs6490-rubikpi3: enable AP6256 SDIO WiFi
# Plus kconfig fragments to enable BCM4345C5 UART HCI (Bluetooth) and
# brcmfmac SDIO (WiFi).
FILESEXTRAPATHS:prepend:qcs6490-thundercomm-rubikpi3 := "${THISDIR}/qcs6490-thundercomm-rubikpi3:"

SRC_URI:append:qcs6490-thundercomm-rubikpi3 = " \
    file://0001-lt9611-port-b.patch \
    file://0002-dts-port-b.patch \
    file://0003-wifi-sdio.patch \
    file://bt-bcm.cfg \
    file://wifi-bcm.cfg \
"
