#
# Copyright (C) 2013 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/chagalllte

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := insignal
TARGET_SOC := exynos5420

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a15

# Enable QC's libm optimizations
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Audio
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true

# RIL
BOARD_PROVIDES_LIBRIL := true
# hardware/samsung/ril
BOARD_MODEM_TYPE := xmm7260
# RIL.java overwrite
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Bootloader
TARGET_OTA_ASSERT_DEVICE := chagalllte

# Camera
# COMMON_GLOBAL_CFLAGS += -DUSE_MEMORY_HEAP_ION
BOARD_NEEDS_MEMORYHEAPION := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_DVFS

# Force the screenshot path to CPU consumer
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := cyanogenmod_chagalllte_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/chagalllte
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.8
#TARGET_PREBUILT_KERNEL := device/samsung/chagalllte/kernel

# Battery
BOARD_BATTERY_DEVICE_NAME := battery

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := universal5420
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true
BOARD_USES_NEON_BLITANTIH := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
BOARD_EGL_SYSTEMUI_PBSIZE_HACK := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_USE_BGRA_8888 := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 5
# OVERRIDE_RS_DRIVER := libRSDriverArm.so

# HWCServices
BOARD_USES_HWC_SERVICES := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Hardware
BOARD_HARDWARE_CLASS += device/samsung/chagalllte/cmhw

# Init
TARGET_NR_SVC_SUPP_GIDS := 20

# Media
COMMON_GLOBAL_CFLAGS += -DUSE_NATIVE_SEC_NV12TILED # use format from fw/native
COMMON_GLOBAL_CFLAGS += -DWIDEVINE_PLUGIN_PRE_NOTIFY_ERROR

# OpenMAX Video
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_CSC_HW := false
BOARD_USE_H264_PREPEND_SPS_PPS := false
BOARD_USE_QOS_CTRL := false
BOARD_USE_VP8ENC_SUPPORT := true
BOARD_USE_ENCODER_RGBINPUT_SUPPORT := true
BOARD_USE_DUALDPB_MODE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 9639936 
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2506096640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12629049344
BOARD_FLASH_BLOCK_SIZE := 4096

BOARD_KERNEL_TAGS_OFFSET := 0x00f00000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000

# PowerHAL
TARGET_POWERHAL_VARIANT := chagalllte

# Recovery
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.universal5420
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/rootdir/etc/init.recovery.universal5420.rc
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_RECOVERY_SWIPE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Scaler
BOARD_USES_SCALER := true

# SELinux
BOARD_SEPOLICY_DIRS := \
    device/samsung/chagalllte/sepolicy

BOARD_SEPOLICY_UNION := \
    file_contexts \
    genfs_contexts \
    adbd.te \
    app.te \
    device.te \
    domain.te \
    gpsd.te \
    file.te \
    mediaserver.te \
    surfaceflinger.te \
    samsung_media.te \
    system.te

# SurfaceFlinger
BOARD_USES_SYNC_MODE_FOR_MEDIA := true

# Webkit
ENABLE_WEBGL := true

# WFD
BOARD_USES_WFD_SERVICE := true
BOARD_USES_WFD := true

# Wifi
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"

# TW Flags
DEVICE_RESOLUTION := 2560x1600
TW_NO_USB_STORAGE := true
TW_INCLUDE_JB_CRYPTO := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_SUPPRESS_SECURE_ERASE := true

# inherit from the proprietary version
-include vendor/samsung/chagalllte/BoardConfigVendor.mk
