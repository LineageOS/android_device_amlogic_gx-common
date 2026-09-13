#!/bin/env python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

import common


def FullOTA_InstallEnd(info):
    OTA_InstallEnd(info)
    return


def IncrementalOTA_InstallEnd(info):
    OTA_InstallEnd(info)
    return


def AddImage(info, folder, basename):
    data = info.input_zip.read(folder + basename)
    common.ZipWriteStr(info.output_zip, basename, data)


def PrintInfo(info, dest):
    info.script.Print("Patching {} image unconditionally...".format(
        dest.split('/')[-1]))


def WriteImage(info, folder, basename, dest):
    AddImage(info, folder, basename)
    PrintInfo(info, dest)
    info.script.AppendExtra('package_extract_file("%s", "%s");' %
                            (basename, dest))


def OTA_InstallEnd(info):
    WriteImage(info, "IMAGES/", "vbmeta.img", "/dev/block/by-name/vbmeta")
    if 'RADIO/logo.img' in info.input_zip.namelist():
        WriteImage(info, "RADIO/", "logo.img", "/dev/block/by-name/logo")
    if 'RADIO/misc.img' in info.input_zip.namelist():
        AddImage(info, "RADIO/", "misc.img")
    return
