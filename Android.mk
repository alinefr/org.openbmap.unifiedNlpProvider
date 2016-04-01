# Copyright (c) 2015 μg Project Team
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := org.openbmap.unifiedNlpProvider
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := org.openbmap.unifiedNlpProvider

openbmap_root  := $(LOCAL_PATH)
openbmap_out   := $(OUT_DIR)/target/common/obj/APPS/$(LOCAL_MODULE)_intermediates
openbmap_build := $(gmscore_root)/build
openbmap_apk   := build/outputs/apk/org.openbmap.unifiedNlpProvider-release.apk

$(gmscore_root)/$(gmscore_apk):
	rm -Rf $(gmscore_build)
	mkdir -p $(gmscore_out)
	ln -s $(gmscore_out) $(gmscore_build)
	echo "sdk.dir=$(ANDROID_HOME)" > $(gmscore_root)/local.properties
	cd $(gmscore_root) && git submodule update --recursive --init && \
		JAVA_TOOL_OPTIONS="$(JAVA_TOOL_OPTIONS) -Dfile.encoding=UTF8" ../gradlew assembleRelease

LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(gmscore_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)
