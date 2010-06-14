{application, memcached_rest,
 [{description, "memcached_rest"},
  {vsn, "0.18"},
  {modules, [
    memcached_rest,
    memcached_rest_app,
    memcached_rest_sup,
    memcached_rest_deps,
    memcached_rest_resource
  ]},
  {registered, []},
  {mod, {memcached_rest_app, []}},
  {env, []},
  {applications, [kernel, stdlib, crypto]}]}.
