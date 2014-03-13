LOCAL_PATH := $(call my-dir)

###########################
# isac test app

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := tests
LOCAL_CPP_EXTENSION := .cc
LOCAL_SRC_FILES:= kenny.c

# Flags passed to both C and C++ files.
LOCAL_CFLAGS := $(MY_WEBRTC_COMMON_DEFS)

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../interface \
    $(LOCAL_PATH)/../../../../../..

MY_LIB_SUFFIX :=
ifdef WEBRTC_STL
MY_LIB_SUFFIX := _$(WEBRTC_STL)
endif

LOCAL_STATIC_LIBRARIES := \
    libwebrtc_isacfix$(MY_LIB_SUFFIX) \
    libwebrtc_spl$(MY_LIB_SUFFIX) \
    libwebrtc_system_wrappers$(MY_LIB_SUFFIX)

ifeq ($(WEBRTC_BUILD_NEON_LIBS),true)
LOCAL_STATIC_LIBRARIES += \
    libwebrtc_isacfix_neon$(MY_LIB_SUFFIX)
endif

LOCAL_SHARED_LIBRARIES := \
    libutils

LOCAL_MODULE:= webrtc_isac_test

ifdef NDK_ROOT
include $(BUILD_EXECUTABLE)
else
ifndef WEBRTC_STL
LOCAL_SHARED_LIBRARIES += libstlport
include external/stlport/libstlport.mk
else
LOCAL_NDK_STL_VARIANT := $(WEBRTC_STL)
LOCAL_SDK_VERSION := 14
LOCAL_MODULE := $(LOCAL_MODULE)_$(WEBRTC_STL)
LOCAL_SHARED_LIBRARIES :=
endif
include $(BUILD_NATIVE_TEST)
endif
