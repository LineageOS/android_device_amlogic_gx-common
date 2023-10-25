#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

## Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.1-impl

## Bluetooth
ifneq ($(BOARD_HAVE_BLUETOOTH),false)
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service
endif

## Boot animation
TARGET_BOOTANIMATION_HALF_RES := true

## Codecs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

ifneq ($(PRODUCT_USE_SW_OMX),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
endif

## DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

## Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.2-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl

PRODUCT_COPY_FILES +=  \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mesondisplay.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mesondisplay.cfg

## Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# Init-Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/fstab.amlogic:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.amlogic \
    $(LOCAL_PATH)/init-files/init.amlogic.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.board.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.board.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.media.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.media.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.usb.rc \
    $(LOCAL_PATH)/init-files/init.recovery.amlogic.rc:recovery/root/init.recovery.amlogic.rc \
    $(LOCAL_PATH)/init-files/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc

## Kernel Modules
PRODUCT_PACKAGES += \
    mali \
    media \
    optee-module

## Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service \
    android.hardware.keymaster@3.0-impl \

## OMX
PRODUCT_PACKAGES += \
    libavservices_minijail_vendor

## Platform
TARGET_AMLOGIC_SOC ?= gxl

## Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.0-service \
    power.default

## Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-lite-vendorcompat

## Shim
PRODUCT_PACKAGES += \
    libaml_symbols

## Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

## Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-service \
    android.hardware.thermal@1.0-impl

## Vibrator
PRODUCT_PACKAGES += \
    vibrator.default

# VNDK
PRODUCT_PACKAGES += \
    libutils-v32

## Widevine DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.1.vendor

## Inherit from the main common tree product makefile
$(call inherit-product, device/amlogic/common/amlogic.mk)

## Inherit from the common proprietary files makefile
$(call inherit-product, vendor/amlogic/gx-common/gx-common-vendor.mk)
