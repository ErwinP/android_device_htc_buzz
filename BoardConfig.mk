# Copyright (C) 2011 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# throughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/buzz/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/htc/buzz/include

# ARMv6-compatible processor rev 5 (v6l)
TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv6j
TARGET_CPU_ABI := armeabi-v6j
TARGET_CPU_ABI2 := armeabi

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_LDPI_RECOVERY := true

TARGET_BOOTLOADER_BOARD_NAME := buzz
TARGET_OTA_ASSERT_DEVICE := buzz
TARGET_BOARD_INFO_FILE := device/htc/buzz/board-info.txt

### Wifi related defines
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcm4329
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext

#WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcm4329/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/proc/calibration iface_name=wlan0"
BOARD_WLAN_DEVICE_REV            := bcm4329
WIFI_BAND                        := 802_11_ABG

## kernel
TARGET_KERNEL_CONFIG   		:= buzz_defconfig
# TARGET_PREBUILT_KERNEL 		:= device/htc/buzz/prebuilt/kernel
TARGET_RECOVERY_INITRC 		:= device/htc/buzz/initramfs/init.recovery.rc
TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/buzz/prebuilt/recovery_kernel

BOARD_KERNEL_CMDLINE 		:= no_console_suspend=1 console=null
BOARD_KERNEL_BASE 		:= 0x02E00000
BOARD_KERNEL_PAGESIZE 		:= 2048

# Enable gsm and network search
COMMON_GLOBAL_CFLAGS += -DFORCE_RILD_AS_ROOT # Not sure if this is needed
BOARD_FORCE_RILD_AS_ROOT := true
BOARD_USES_LEGACY_RIL := true
BOARD_USE_NEW_LIBRIL_HTC := true

## Buzz graphics
BOARD_NO_RGBX_8888 := true
COMMON_GLOBAL_CFLAGS += -DNO_RGBX_8888 -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS -DUNABLE_TO_DEQUEUE
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
TARGET_FORCE_CPU_UPLOAD 	   := true
USE_OPENGL_RENDERER   		   := false
BOARD_EGL_CFG 	      		   := device/htc/buzz/egl.cfg
BOARD_HAS_LIMITED_EGL 		   := true

# Allow fallback to ashmem
TARGET_GRALLOC_USES_ASHMEM 	:= true
TARGET_USES_GENLOCK 		:= true
TARGET_USES_C2D_COMPOSITION 	:= false
TARGET_HAVE_BYPASS 		:= true

## Qualcomm
# camera
BOARD_CAMERA_USE_GETBUFFERINFO := true
COMMON_GLOBAL_CFLAGS += -DNO_RGBX_8888 -DBINDER_COMPAT

# audio (prevent breakage from QCOM_HARDWARE in system/audio.h)
COMMON_GLOBAL_CFLAGS += -DLEGACY_AUDIO_COMPAT
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_ICS_LIBAUDIO  := true
BOARD_USES_AUDIO_LEGACY  := false

# GPS
BOARD_GPS_LIBRARIES := libgps librpc
BOARD_USES_GPSSHIM  := true

# bluetooth
BOARD_HAVE_BLUETOOTH 	 := true
BOARD_HAVE_BLUETOOTH_BCM := true

# touchscreen
BOARD_USE_SKIA_LCDTEXT := true
BOARD_USE_NEW_LIBRIL_HTC := true
BOARD_USE_LEGACY_TOUCHSCREEN := true

# trackball
BOARD_USE_LEGACY_TRACKPAD := true

# Qcom specifics
BOARD_USES_QCOM_LIBS := true
BOARD_VENDOR_USE_AKMD := akm8973
BOARD_VENDOR_QCOM_AMSS_VERSION := 1355
TARGET_NO_HW_VSYNC := true
TARGET_DISABLE_TRIPLE_BUFFERING := true
BOARD_NEEDS_MEMORYHEAPPMEM := true

## web
TARGET_WEBKIT_USE_MORE_MEMORY := true
JS_ENGINE := v8
HTTP := chrome

WITH_JIT := true
ENABLE_JSC_JIT := true

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 000a0000 00020000 "misc"
# mtd1: 00420000 00020000 "recovery"
# mtd2: 002c0000 00020000 "boot"
# mtd3: 0fa00000 00020000 "system"
# mtd4: 02800000 00020000 "cache"
# mtd5: 0af20000 00020000 "userdata"
# Changed for Buzz
BOARD_BOOTIMAGE_PARTITION_SIZE 		:= 2883584
BOARD_RECOVERYIMAGE_PARTITION_SIZE 	:= 4325376
BOARD_SYSTEMIMAGE_PARTITION_SIZE 	:= 262144000
BOARD_USERDATAIMAGE_PARTITION_SIZE 	:= 183631872
BOARD_FLASH_BLOCK_SIZE 			:= 131072

# Usb mouting
BOARD_UMS_LUNFILE 		:= "/sys/devices/platform/usb_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

# Boot animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 240
TARGET_BOOTANIMATION_USE_RGB565 := true

# FM radio support
BOARD_HAVE_FM_RADIO 	:= true
BOARD_FM_DEVICE 	:= bcm4325
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
