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

# overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/chagalllte/overlay

$(call inherit-product, device/samsung/exynos5420-common/exynos5420-common.mk)

# Audio
PRODUCT_PACKAGES += \
    audio.primary.universal5420 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    mixer_paths.xml \
    tinymix

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1600

# Fingerprint reader
PRODUCT_PACKAGES += \
    fingerprint.default

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=true

# Lights
PRODUCT_PACKAGES += \
    lights.universal5420

# Media profile
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml  \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# simple kernel module load script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/01moduleload:system/etc/init.d/01moduleload

# simple script for system tuning
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/10systemtuning:system/etc/init.d/10systemtuning

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Power
PRODUCT_PACKAGES += \
    power.universal5420

PRODUCT_PACKAGES += \
    init.universal5420.rc \
    init.baseband.rc \
    ueventd.universal5420.rc

# Radio (needed for audio controls even on wifi-only)
PRODUCT_PACKAGES += \
    libsecril-client \
    libsecril-client-sap \
    libril \
    librilutils \
    rild 

# Sensors
PRODUCT_PACKAGES += \
    sensors.universal5420

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=unknown 

# call the proprietary setup
$(call inherit-product-if-exists, vendor/samsung/chagalllte/chagalllte-vendor.mk)
