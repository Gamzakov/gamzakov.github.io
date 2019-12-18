export ARCHS = arm64 arm64e
export TARGET = iphone:clang:latest:12.0

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SberJailbreakBypass

after-install::
	install.exec "killall -9 SpringBoard"

SberJailbreakBypass_FILES = Tweak.x
SberJailbreakBypass_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk