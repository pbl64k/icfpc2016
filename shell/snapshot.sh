#!/bin/sh
DIR=`dirname "$(readlink -f "$0")"`
KEY="${DIR}/api_key"
curl --compressed -L -H Expect: -H "X-API-Key: `cat $KEY`" 'http://2016sv.icfpcontest.org/api/snapshot/list'
