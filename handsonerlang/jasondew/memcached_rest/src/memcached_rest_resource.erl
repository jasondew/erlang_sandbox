-module(memcached_rest_resource).

-export([init/1, allowed_methods/2, content_types_provided/2, resource_exists/2, to_text/2]).

-include_lib("webmachine/include/webmachine.hrl").

init([]) -> {ok, []}.

allowed_methods(_ReqProps, Context) -> {['GET', 'DELETE'], Context}.

content_types_provided(_ReqProps, Context) -> {[{"text/plain", to_text}], Context}.

resource_exists(ReqProps, Context) ->
  Id = ?PATH(ReqProps),
  io:format("Id = ~p~n", [Id]),
%%  Request = ?REQ(ReqProps),

  case memcached:find_value(Id) of
    {ok, Value} -> {true, Value};
    error       -> {false, Context}
  end.

to_text(_ReqProps, Value) -> {Value, Value}.
