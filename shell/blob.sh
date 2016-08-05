#!/bin/sh
curl --compressed -L -H Expect: -H "X-API-Key: `cat api_key`" "http://2016sv.icfpcontest.org/api/blob/$1"
