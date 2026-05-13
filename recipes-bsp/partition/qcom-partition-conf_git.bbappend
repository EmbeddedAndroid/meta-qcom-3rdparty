# TEMP local-only bbappend for testing — qcom-ptool PR #115 adds the
# rubikpi3 platform; point at our fork until it lands upstream.
SRC_URI = "git://github.com/EmbeddedAndroid/qcom-ptool.git;branch=rubikpi3;protocol=https"
SRCREV = "0f41e652278ccd516f498a6505bf2e1251657883"

# qcom-ptool CLI is installed system-wide in our locally-derived kas image
# (/usr/local/bin/qcom-ptool). Symlink it into bitbake's hosttools dir
# so the recipe Makefile can find it.
do_compile:prepend() {
    ln -sf /usr/local/bin/qcom-ptool ${HOSTTOOLS_DIR:-/work/build/tmp/hosttools}/qcom-ptool 2>/dev/null || true
}
