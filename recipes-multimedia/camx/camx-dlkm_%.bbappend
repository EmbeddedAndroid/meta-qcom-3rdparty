# Bump to v1.0.1 which fixes Linux 7.1 compatibility:
#   - dma_fence->lock replaced by union/dma_fence_spinlock() in 7.1
#   - linux/of_gpio.h removed in 6.13, of_get_named_gpio() wrapper needed
PV:ventuno-q = "1.0.1"
SRCREV:ventuno-q = "60755e6a8d744d5629d1b4d07237179a238b6778"
