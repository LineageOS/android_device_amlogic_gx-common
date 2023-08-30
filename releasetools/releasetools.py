#!/bin/env python3
#
# Copyright (C) 2020-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

import common
import re

def FullOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def IncrementalOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def AddImage(info, folder, basename, dest):
  name = basename
  data = info.input_zip.read(folder + basename)
  common.ZipWriteStr(info.output_zip, name, data)
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def PrintInfo(info, dest):
  info.script.Print("Patching {} image unconditionally...".format(dest.split('/')[-1]))

def OTA_InstallEnd(info):
  PrintInfo(info, "/dev/block/vbmeta")
  AddImage(info, "IMAGES/", "vbmeta.img", "/dev/block/vbmeta")
  if 'RADIO/bootloader.img' in info.input_zip.namelist():
    PrintInfo(info, "/dev/block/bootloader")
    AddImage(info, "RADIO/", "bootloader.img", "/dev/block/bootloader")
  return
