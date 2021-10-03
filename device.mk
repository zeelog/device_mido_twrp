#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2021-2022 TeamWin Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# qcom standard decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Resolution
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl.recovery

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=mido \
    PRODUCT_NAME=$(PRODUCT_RELEASE_NAME) \
    TARGET_DEVICE=mido

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.product=mido

# Blacklist
PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.bootimage.build.date.utc \
    ro.build.date.utc

# Vibrator
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/proprietary/vibrator/system/,$(TARGET_COPY_OUT_RECOVERY)/root/system/)
