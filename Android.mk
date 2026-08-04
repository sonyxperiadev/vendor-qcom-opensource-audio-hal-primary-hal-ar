MY_LOCAL_PATH := $(call my-dir)

LATEST_ANDROID_HARDWARE_AUDIO_CORE := android.hardware.audio.core-V3-ndk
ifeq ($(PLATFORM_VERSION), 16)
LATEST_ANDROID_HARDWARE_AUDIO_EFFECT := android.hardware.audio.effect-V3-ndk
else
LATEST_ANDROID_HARDWARE_AUDIO_EFFECT := android.hardware.audio.effect-V4-ndk
endif
LATEST_ANDROID_HARDWARE_COMMON := android.hardware.common-V2-ndk
LATEST_ANDROID_MEDIA_AUDIO_COMMON_TYPES := android.media.audio.common.types-V4-ndk
LATEST_ANDROID_HARDWARE_COMMON_FMQ := android.hardware.common.fmq-V1-ndk

# to have similar to cc_defaults in make files
EFFECTS_DEFAULTS_SHARED_LIBRARIES := \
    $(LATEST_ANDROID_HARDWARE_AUDIO_EFFECT) \
    $(LATEST_ANDROID_HARDWARE_COMMON) \
    $(LATEST_ANDROID_MEDIA_AUDIO_COMMON_TYPES) \
    $(LATEST_ANDROID_HARDWARE_COMMON_FMQ) \
    libbase \
    libbinder_ndk \
    libcutils \
    libfmq \
    libutils

EFFECTS_DEFAULTS_HEADERS_LIBRARIES := \
    libaudioeffectsaidlqti_headers \
    libaudioutils_headers \
    libaudio_system_headers \
    libsystem_headers

include $(MY_LOCAL_PATH)/hal/Android.mk
