#!/bin/sh
DIR=`dirname "$(readlink -f "$0")"`
KEY="${DIR}/api_key"
curl --compressed -L -H Expect: -H "X-API-Key: `cat $KEY`" -F "problem_id=$1" -F "solution_spec=@$2" 'http://2016sv.icfpcontest.org/api/solution/submit'
