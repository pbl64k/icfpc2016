#!/bin/sh
curl --compressed -L -H Expect: -H "X-API-Key: `cat api_key`" -F "problem_id=$1" -F "solution_spec=@$2" 'http://2016sv.icfpcontest.org/api/solution/submit'
