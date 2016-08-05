#!/bin/sh
DIR=`dirname "$(readlink -f "$0")"`
KEY="${DIR}/api_key"
curl --compressed -L -H Expect: -H "X-API-Key: `cat $KEY`" -F "solution_spec=@$1" -F "publish_time=$2" 'http://2016sv.icfpcontest.org/api/problem/submit'
