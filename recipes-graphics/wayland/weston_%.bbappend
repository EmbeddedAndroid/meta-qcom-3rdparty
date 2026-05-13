# LOCAL-ONLY: Build Weston with the RDP backend (rdp-backend.so) so we can
# expose a screen-share over the LAN. Pulls in libfreerdp + libwinpr.
PACKAGECONFIG:append = " rdp"
