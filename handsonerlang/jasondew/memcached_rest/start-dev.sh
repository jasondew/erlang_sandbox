#!/bin/sh
cd `dirname $0`
exec erl -pa $PWD/ebin $PWD/deps/*/ebin -pz ../ -boot start_sasl -s reloader -s memcached_rest
