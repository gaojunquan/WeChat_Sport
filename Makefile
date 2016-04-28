THEOS_DEVICE_IP = 172.18.1.114
ARCHS = armv7 arm64
TARGET = iPhone:latest:7.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = hookWXYD
hookWXYD_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
