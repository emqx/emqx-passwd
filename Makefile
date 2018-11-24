PROJECT = emqx_passwd
PROJECT_DESCRIPTION = Password Hash Library for EMQ X Broker
PROJECT_VERSION = 0.1

DEPS = pbkdf2 bcrypt

dep_pbkdf2 = git-emqx https://github.com/emqx/erlang-pbkdf2 2.0.2
dep_bcrypt = git-emqx https://github.com/emqx/erlang-bcrypt 0.5.3

LOCAL_DEPS = ssl

ERLC_OPTS += +debug_info
ERLC_OPTS += +warnings_as_errors +warn_export_all +warn_unused_import

CT_SUITES = emqx_passwd

define dep_fetch_git-emqx
	git clone -q --depth 1 -b $(call dep_commit,$(1)) -- $(call dep_repo,$(1)) $(DEPS_DIR)/$(call dep_name,$(1)) > /dev/null 2>&1; \
	cd $(DEPS_DIR)/$(call dep_name,$(1));
endef

include erlang.mk
