WELCOME1 = Welcome
WELCOME2 = WelcomeOS
WELCOME3 = Welcome OS
WHALECUM = Whalecum

WELCOME_VERSION_NAME = nine

ifeq ($(WELCOME_HAHA),true)
    WELCOME_CUSTOM_SERIAL := 0123456ABCDEF
    WELCOME_CUSTOM_BUILD_NUMBER_OVERLAY := WELCOME_TO_HELL 
    ADDITIONAL_BUILD_PROPERTIES += ro.welcome.haha=true
endif

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

ADDITIONAL_BUILD_PROPERTIES += \
    ro.welcome.version.name=$(WELCOME_VERSION_NAME) \
    ro.welcome.version.codemame=$(WHALECUM)
