LOCAL_PATH := device/xiaomi/mi_x08a

# Define hardware platform
PRODUCT_PLATFORM := mt8167

AB_OTA_UPDATER := true
BOARD_USES_RECOVERY_AS_BOOT := true

PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)/bootctrl \

# A/B partitions
AB_OTA_PARTITIONS := \
    boot \
    system \
    lk \
    preloader

# Bootctrl
PRODUCT_PACKAGES_DEBUG += \
    update_engine_client \
    bootctl

# A/B support
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_HOST_PACKAGES += \
    brillo_update_payload

# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.$(PRODUCT_PLATFORM) \
    libgptutils \
    libz \
    libcutils

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    bootctrl.$(PRODUCT_PLATFORM)
