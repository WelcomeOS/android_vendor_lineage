WELCOME_VERSION_NAME = nine

ifeq ($(WELCOME_HAHA),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.welcome.custom.serial=0123456ABCDEF 
    ro.custom.build.version=WELCOME_TO_HELL
else
ifneq ($(WELCOME_CUSTOM_SERIAL),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.welcome.custom.serial=$(WELCOME_CUSTOM_SERIAL)
endif

ifeq ($WELCOME_CUSTOM_BUILD_NUMBER_OVERLAY),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.build.version=welcome_$(WELCOME_VERSION_NAME)-$(shell date -u +%Y%m%d)
else
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.build.version=$(WELCOME_CUSTOM_BUILD_NUMBER_OVERLAY)
endif
endif
