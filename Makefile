## shallow clone for speed
REBAR_GIT_CLONE_OPTIONS += --depth 1
export REBAR_GIT_CLONE_OPTIONS

REBAR = rebar3
all: compile

compile:
	$(REBAR) compile

clean:
	$(REBAR) clean
	@rm -rf _build/default/lib/*/ebin
	@rm -rf _build/default/lib/*/priv/*.so

ct: compile
	$(REBAR) as test ct

eunit: compile
	$(REBAR) as test eunit

xref:
	$(REBAR) xref

cover:
	$(REBAR) cover

distclean:
	@rm -rf _build
	@rm -f data/app.*.config data/vm.*.args rebar.lock
