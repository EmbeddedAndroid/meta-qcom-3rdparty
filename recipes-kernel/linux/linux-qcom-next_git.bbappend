FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

FILESEXTRAPATHS:prepend:radxa-dragon-q6a := "${THISDIR}/radxa-dragon-q6a:"

SRC_URI:append:radxa-dragon-q6a = " \
			file://realtek-eth-8169.cfg \
"

# Arduino VENTUNO Q (monza / QCS8275). Kernel comes from the
# qualcomm-linux kernel-topics.git early/hwe/monza branch at 7.1-rc4,
# not the kernel.git tag the other machines track.
LINUX_VERSION:ventuno-q = "7.1-rc4"
SRCREV:ventuno-q = "107224669d45301485ecd75975f78de5861afde7"
KBUILD_CONFIG_EXTRA:remove:ventuno-q = "${S}/arch/arm64/configs/prune.config ${S}/arch/arm64/configs/qcom.config"
SRCBRANCH:ventuno-q = "nobranch=1"
SRCBRANCH:class-devupstream:ventuno-q = "branch=early/hwe/monza"
SRC_URI:remove:ventuno-q = "git://github.com/qualcomm-linux/kernel.git;${SRCBRANCH};protocol=https"
SRC_URI:append:ventuno-q = " git://github.com/qualcomm-linux/kernel-topics.git;${SRCBRANCH};protocol=https file://configs/monza.cfg file://0001-PCI-Disable-ASPM-L1ss-for-QCA2066-behind-PI7C9X2G304.patch file://0002-usb-gadget-f_fs-initialize-reset_work-at-allocation.patch"
