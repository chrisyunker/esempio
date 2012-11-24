-module(esempio_server).

-behavior(gen_server).

%% external exports
-export([
    start_link/0
    ]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {
    }).


start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

%% ===================================================================
%% gen_server callbacks
%% ===================================================================

init(_) ->
    lager:info("esempio_server started..."),
    EsempioConfig = application:get_env(esempio, esempio_config),
    lager:info("esempio_config: ~p", [EsempioConfig]),
    {ok, #state{}}.

handle_call(Request, _From, S) ->
    lager:error("unhandled call request: ~p", [Request]),
    {reply, ok, S}.

handle_cast(Request, S) ->
    lager:error("unhandled cast: ~p", [Request]),
    {noreply, S}.

handle_info(Info, S) ->
    lager:error("unhandled info: ~p", [Info]),
    {noreply, S}.

terminate(Reason, _S) ->
    lager:error("terminate reason: ~p", [Reason]),
    ok.

code_change(_OldVsn, S, _Extra) ->
    {ok, S}.

