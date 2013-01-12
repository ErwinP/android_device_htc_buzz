LOCAL_PATH := $(my-dir)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),buzz)
    subdir_makefiles := \
        $(LOCAL_PATH)/libaudio/Android.mk \
        $(LOCAL_PATH)/libcopybit/Android.mk \
        $(LOCAL_PATH)/libgralloc/Android.mk \
        $(LOCAL_PATH)/liblights/Android.mk \
        $(LOCAL_PATH)/librpc/Android.mk \
        $(LOCAL_PATH)/libsensors/Android.mk \
        $(LOCAL_PATH)/libstagefrighthw/Android.mk \
        $(LOCAL_PATH)/libcamera/Android.mk \
        $(LOCAL_PATH)/recovery/offmode/Android.mk

    include $(subdir_makefiles)
endif
