#
# Copyright (C) 2016 The CyanogenMod Project
#               2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifeq ($(TARGET_SCREEN_WIDTH),)
    $(warning TARGET_SCREEN_WIDTH is not set, using default value: 720)
    TARGET_SCREEN_WIDTH := 720
endif
ifeq ($(TARGET_SCREEN_HEIGHT),)
    $(warning TARGET_SCREEN_HEIGHT is not set, using default value: 1280)
    TARGET_SCREEN_HEIGHT := 1280
endif

define build-bootanimation
    $(shell) vendor/lineage/shutdownanimation/generate-shutdownanimation.sh \
    $(PRODUCT_OUT) \
    $(TARGET_SCREEN_WIDTH) \
    $(TARGET_SCREEN_HEIGHT) \
    $(TARGET_BOOTANIMATION_HALF_RES)
endef

TARGET_GENERATED_SHUTDOWNANIMATION := $(TARGET_OUT_INTERMEDIATES)/SHUTDOWNANIMATION/shutdownanimation.zip
$(TARGET_GENERATED_SHUTDOWNANIMATION):
	@echo "Building shutdownanimation"
	$(build-shutdownanimation)

ifeq ($(TARGET_SHUTDOWNANIMATION),)
    TARGET_SHUTDOWNANIMATION := $(TARGET_GENERATED_SHUTDOWNANIMATION)
    ifeq ($(shell command -v mogrify),)
        $(info **********************************************)
        $(info The boot animation could not be generated as)
        $(info ImageMagick is not installed in your system.)
        $(info $(space))
        $(info Please install ImageMagick from this website:)
        $(info https://imagemagick.org/script/binary-releases.php)
        $(info **********************************************)
        $(error stop)
    endif
endif

include $(CLEAR_VARS)
LOCAL_MODULE := shutdownanimation.zip
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/media

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(TARGET_SHUTDOWNANIMATION)
	@mkdir -p $(dir $@)
	@cp $(TARGET_SHUTDOWNANIMATION) $@
