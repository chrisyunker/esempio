.PHONY: clean

all: compile

get-deps: rebar
	./rebar get-deps

compile: get-deps
	./rebar compile

rel: compile
	./rebar generate -f

test: compile
	./rebar skip_deps=true eunit

clean: rebar
	./rebar clean

rebar:
	wget http://cloud.github.com/downloads/basho/rebar/rebar && chmod u+x rebar
