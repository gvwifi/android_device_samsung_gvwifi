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

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    ro.sf.hwrotation=180 \
    ro.surface_flinger.primary_display_orientation=ORIENTATION_180 \
    debug.sf.ignore_hwc_physical_display_orientation=true \
    qemu.hw.mainkeys=0

# Low-RAM optimizations for 2GB device
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true

# Dalvik/Art (tuned for 2GB)
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=96m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

# LMKD tuning
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lmk.critical=0 \
    ro.lmk.medium=800 \
    ro.lmk.critical_upgrade=true \
    ro.lmk.upgrade_pressure=40 \
    ro.lmk.downgrade_pressure=60 \
    ro.lmk.psi_complete_stall_ms=150

# Dex2oat thread limits (prevent OOM during app install)
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-threads=2 \
    dalvik.vm.image-dex2oat-threads=2 \
    dalvik.vm.bg-dex2oat-threads=1

# Background service limits
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.bservice_age=5000 \
    ro.sys.fw.bservice_limit=5 \
    persist.sys.fw.trim_enable_memory=1073741824

# SurfaceFlinger / GPU optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    debug.sf.latch_unsignaled=1

# Radio
# Galaxy View WiFi (gvwifi) is a WiFi-only tablet with no cellular modem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=1
#    telephony.lteOnCdmaDevice=0 \
#    persist.radio.sib16_support=0 \
#    rild.libpath=/system/vendor/lib/libsec-ril.so \
#    rild.libargs=-d /dev/ttyS0 \
#    ro.ril.telephony.mqanelements=6 \
#    ro.telephony.default_network=9 \
#    ro.use_data_netmgrd=false \
#    persist.data.netmgrd.qos.enable=false \
#    ro.ril.hsxpa=1 \
#    ro.ril.gprsclass=10 \
#    ro.smps.enable=true \
#    persist.data.netmgrd.qos.enable=false \
#    ro.use_data_netmgrd=false \
#    ro.telephony.get_imsi_from_sim=true \
#    ro.ril.force_eri_from_xml=true

# Multitasking / Windowing optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    persist.wm.debug.desktop_experience_devopts=0

# ADB / Debugging (Product Properties - Overrides System)
# PRODUCT_PRODUCT_PROPERTIES += \
#    ro.adb.secure=0 \
#    ro.secure=0 \
#    ro.debuggable=1