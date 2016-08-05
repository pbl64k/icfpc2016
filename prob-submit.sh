#!/bin/sh
curl --compressed -L -H Expect: -H "X-API-Key: `cat api_key`" -F "solution_spec=@$1" -F "publish_time=$2" 'http://2016sv.icfpcontest.org/api/problem/submit'
