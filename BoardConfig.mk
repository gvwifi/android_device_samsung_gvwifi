#
# Copyright (C) 2018 The LineageOS Project
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

# Inherit from universal7580-common
include device/samsung/universal7580-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/gvwifi

TARGET_OTA_ASSERT_DEVICE := gvwifi,gvlte

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Network Routing
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# RIL
# BOARD_MODEM_TYPE := tss310
# BOARD_PROVIDES_LIBRIL := true
# BOARD_NEEDS_ROAMING_PROTOCOL_FIELD := true

# Init
$(call soong_config_set,libinit,vendor_init_lib,libinit_gvwifi)

# Partitions
BOARD_HAS_NO_MISC_PARTITION:= false
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 104857600
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_RAMDISK_USE_XZ := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 39845888
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3145728000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13514047488
BOARD_FLASH_BLOCK_SIZE := 4096

# Kernel
TARGET_KERNEL_CONFIG := lineageos_gvwifi_defconfig

# Recovery
TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_DOWN
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
TARGET_RECOVERY_DENSITY := xhdpi

# Manifest
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(LOCAL_PATH)/compatibility_matrix.xml

# Shim
TARGET_LD_SHIM_LIBS += \
    /system/lib/libcamera_client.so|/vendor/lib/libcamera_client_shim.so \
    /system/lib/libstagefright.so|/system/lib/libstagefright_shim.so \
    /system/lib/libexynoscamera.so|/vendor/lib/libexynoscamera_shim.so

# Camera - front only device (SR261 front camera, no rear camera)
BOARD_FRONT_CAMERA_ONLY_USE := true
# Keep both sensor macros on SR261 for legacy code paths that still reference
# camera ID 0 as back while front-only remapping is applied in interface code.
BOARD_BACK_CAMERA_SENSOR := 201
BOARD_FRONT_CAMERA_SENSOR := 201

# Camera
# Android 16 camera service rejects HIDL device@1.x (HAL1). Keep HAL3 enabled.
BOARD_CAMERA_HAL3_FEATURE := true

# Legacy BLOB Support
#TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
#    /system/vendor/bin/hw/rild=27
