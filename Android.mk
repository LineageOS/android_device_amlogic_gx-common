#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

ifneq ($(filter gxm gxl,$(TARGET_AMLOGIC_SOC)),)

LOCAL_PATH := $(call my-dir)
include $(call all-makefiles-under,$(LOCAL_PATH))

endif

ifneq ($(filter g12b,$(TARGET_AMLOGIC_SOC)),)
ifeq ($(TARGET_USES_P_MODULES),true)
LOCAL_PATH := $(call my-dir)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
endif
