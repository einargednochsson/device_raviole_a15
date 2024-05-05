#
# Copyright (C) 2024 The Derpfest Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Derp stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/derp/config/common_full_phone.mk)
TARGET_GAPPS_ARCH := arm64
IS_PHONE := true
DERP_BUILDTYPE := Official
TARGET_SUPPORTS_QUICK_TAP := true
EXTRA_UDFPS_ICONS := true

# Inherit device configuration
DEVICE_CODENAME := oriole
DEVICE_PATH := device/google/raviole
VENDOR_PATH := vendor/google/oriole
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)
$(call inherit-product, device/google/gs101/lineage_common.mk)
$(call inherit-product, $(DEVICE_PATH)/$(DEVICE_CODENAME)/device-lineage.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 6
PRODUCT_NAME := derp_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="oriole-user 15 AP4A.250205.002 12821496 release-keys" \
    BuildFingerprint=google/oriole/oriole:15/AP4A.250205.002/12821496:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
