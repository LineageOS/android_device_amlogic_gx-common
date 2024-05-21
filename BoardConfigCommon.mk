#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/amlogic/gx-common

## HIDL
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml

## Kernel
TARGET_KERNEL_CLANG_COMPILE := false
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=d0074000.emmc
TARGET_KERNEL_CONFIG ?= meson64_defconfig
TARGET_KERNEL_SOURCE := kernel/amlogic/linux-4.9-pie
TARGET_USES_P_MODULES ?= true

ifeq ($(WITH_CONSOLE),true)
BOARD_KERNEL_CMDLINE += console=ttyS0,115200 no_console_suspend
endif

## Partitions
SSI_PARTITIONS := system
TREBLE_PARTITIONS := odm vendor
ALL_PARTITIONS := $(SSI_PARTITIONS) $(TREBLE_PARTITIONS)

BOARD_ODMIMAGE_PARTITION_SIZE ?= 134217728
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 1342177280
BOARD_VENDORIMAGE_PARTITION_SIZE ?= 268435456

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

## Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

## Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/init-files/recovery.fstab

## Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

## Vendor SPL
VENDOR_SECURITY_PATCH := 2019-04-05

## Include the main common tree BoardConfig makefile
include device/amlogic/common/BoardConfigAmlogic.mk

## Include the common proprietary BoardConfig makefile
include vendor/amlogic/gx-common/BoardConfigVendor.mk
