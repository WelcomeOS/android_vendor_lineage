#
# Welcome Audio Files
#

ALARM_PATH := vendor/lineage/prebuilt/common/media/audio/alarms
NOTIFICATION_PATH := vendor/lineage/prebuilt/common/media/audio/notifications
RINGTONE_PATH := vendor/lineage/prebuilt/common/media/audio/ringtones

# Notifications
PRODUCT_COPY_FILES += \
    $(NOTIFICATION_PATH)/Smoorezify.ogg:system/media/audio/notifications/Smoorezify.ogg \

# Ringtones
PRODUCT_COPY_FILES += \
    $(RINGTONE_PATH)/Hard_Work.ogg:system/media/audio/ringtones/Hard_Work.ogg \
