
# abc
PRODUCT_PACKAGES += \
    abc

# build version
BUILD_NUMBER := T1.00


# copy all files
define all-preinstall-files-under
$(patsubst ./%,%, \
    $(shell cd device/asus/flo/preinstall_apk; \
    find ./ -type f -and -name "*.apk") \
)
endef

# copy device/asus/flo/preinstall_apk/*.apk to system/preinstall/
PREINSTALL_FILES := $(call all-preinstall-files-under)
ifneq ($(strip $(PREINSTALL_FILES)),) 
PRODUCT_COPY_FILES += $(foreach files, $(PREINSTALL_FILES), \
       $(addprefix device/asus/flo/preinstall_apk/, $(files)):$(addprefix system/preinstall/, $(files)))
endif

PRODUCT_COPY_FILES += \
	device/asus/flo/preinstall_clean.sh:system/bin/preinstall_clean.sh
