LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE            := libaudiocorehal.default
LOCAL_VENDOR_MODULE     := true
LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_CFLAGS := \
    -DBACKEND_NDK \
    -Wall \
    -Wextra \
    -Werror \
    -Wthread-safety

LOCAL_SRC_FILES := \
    DefaultServices.cpp

LOCAL_HEADER_LIBRARIES :=  \
    libxsdc-utils \
    liberror_headers

LOCAL_SHARED_LIBRARIES := \
    libaudioaidlcommon \
    libaudioserviceexampleimpl \
    libbase \
    libbinder_ndk \
    libcutils \
    liblog \
    libdl \
    libxml2 \
    libaudioutils \
    libutils \
    $(LATEST_ANDROID_HARDWARE_COMMON) \
    libmedia_helper \
    libstagefright_foundation \
    libhidlbase \
    libhardware \
    libfmq

ifeq ($(PLATFORM_VERSION), 16)
LOCAL_SHARED_LIBRARIES += \
    $(LATEST_ANDROID_HARDWARE_AUDIO_CORE) \
    $(LATEST_ANDROID_MEDIA_AUDIO_COMMON_TYPES)

LOCAL_VINTF_FRAGMENTS += manifest_audiocorehal_default_16.xml
else
LOCAL_SHARED_LIBRARIES += \
    android.hardware.audio.core-V4-ndk \
    android.media.audio.common.types-V5-ndk

LOCAL_VINTF_FRAGMENTS += manifest_audiocorehal_default.xml
endif

include $(BUILD_SHARED_LIBRARY)

