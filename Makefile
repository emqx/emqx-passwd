PROJECT = emqx_passwd
PROJECT_DESCRIPTION = Password Hash Library for EMQ X Broker
PROJECT_VERSION = 0.1

DEPS = pbkdf2 bcrypt

dep_pbkdf2 = git-emqx https://github.com/emqx/erlang-pbkdf2 2.0.2
dep_bcrypt = git-emqx https://github.com/emqx/erlang-bcrypt 0.5.3

LOCAL_DEPS = ssl

ERLC_OPTS += +debug_info
ERLC_OPTS += +warnings_as_errors +warn_export_all +warn_unused_import

COVER = true

$(shell [ -f erlang.mk ] || curl -s -o erlang.mk https://raw.githubusercontent.com/emqx/erlmk/master/erlang.mk)

include erlang.mk

distclean::
	@rm -rf _build cover deps logs log data
	@rm -f rebar.lock compile_commands.json cuttlefish

rebar-deps:
	rebar3 get-deps

rebar-clean:
	@rebar3 clean

rebar-compile: rebar-deps
	rebar3 compile

rebar-ct:
	rebar3 ct

rebar-xref:
	@rebar3 xref
