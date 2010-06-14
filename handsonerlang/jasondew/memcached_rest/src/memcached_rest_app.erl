%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc Callbacks for the memcached_rest application.

-module(memcached_rest_app).
-author('author <author@example.com>').

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for memcached_rest.
start(_Type, _StartArgs) ->
    memcached_rest_deps:ensure(),
    memcached_rest_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for memcached_rest.
stop(_State) ->
    ok.
