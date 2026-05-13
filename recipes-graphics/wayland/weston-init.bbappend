# LOCAL-ONLY: Override default weston.ini with a DRM-only config + ship a
# second systemd unit (weston-rdp.service) that runs a headless Weston with
# the RDP backend on port 3389. This lets HDMI stay live while still
# offering an LAN-reachable RDP session.

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://weston-rdp.ini \
    file://weston-rdp-cert.service \
    file://weston-rdp.service \
"

do_install:append() {
    install -d ${D}${sysconfdir}/xdg/weston
    install -m 0644 ${UNPACKDIR}/weston-rdp.ini \
        ${D}${sysconfdir}/xdg/weston/weston.ini

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${UNPACKDIR}/weston-rdp-cert.service \
        ${D}${systemd_system_unitdir}/weston-rdp-cert.service
    install -m 0644 ${UNPACKDIR}/weston-rdp.service \
        ${D}${systemd_system_unitdir}/weston-rdp.service
}

FILES:${PN} += " \
    ${systemd_system_unitdir}/weston-rdp-cert.service \
    ${systemd_system_unitdir}/weston-rdp.service \
"

SYSTEMD_SERVICE:${PN} += "weston-rdp-cert.service weston-rdp.service"
