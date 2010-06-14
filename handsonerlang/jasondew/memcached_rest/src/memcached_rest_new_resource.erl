-module(memcached_rest_new_resource).

-export([init/1, allowed_methods/2, content_types_provided/2, resource_exists/2, to_text/2]).

-include_lib("webmachine/include/webmachine.hrl").

init([]) -> {ok, []}.

allowed_methods(_ReqProps, Context) -> {['POST'], Context}.

content_types_provided(_ReqProps, Context) -> {[{"text/plain", to_text}], Context}.

resource_exists(ReqProps, Context) ->
  Request = ?REQ(ReqProps),
  %%add_values(dict:to_list(parse_params(binary_to_list(Request:recv_body())))),
  {true, Context}.

add_values([]) ->
  ok;
add_values([{Name, Value} | Pairs]) ->
  memcached:add_value(Name, Value),
  add_values(Pairs).

to_text(_ReqProps, Context) -> {"ok", Context}.

%% Internal helper functions
parse_params(Body) when is_list(Body) ->
  Pairs = string:tokens(Body, "&"),
  lists:foldr(fun(NV, Acc) ->
                  [Name, Value] = string:tokens(NV, "="),
                  dict:store(Name, Value, Acc) end, dict:new(), Pairs).
