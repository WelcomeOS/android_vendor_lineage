# Include WelcomeOS audio files
include vendor/lineage/config/welcome_audio.mk

# Boot sound
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.bootanim.play_sound=true
