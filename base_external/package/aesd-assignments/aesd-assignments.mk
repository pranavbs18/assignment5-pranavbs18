##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_SITE = git@github.com:pranavbs18/assignment3-pranavbs18.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_VERSION = main
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS

	# Create config directory
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/finder-app/conf

	# Install config files
	$(INSTALL) -m 0644 $(@D)/finder-app/conf/* \
		$(TARGET_DIR)/etc/finder-app/conf/

	# Install writer binary
	$(INSTALL) -m 0755 $(@D)/finder-app/writer \
		$(TARGET_DIR)/usr/bin/

	# Install finder script
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh \
		$(TARGET_DIR)/usr/bin/

	# Install finder-test script
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh \
		$(TARGET_DIR)/usr/bin/

endef

$(eval $(generic-package))
