#!/usr/bin/env python

import sys
import os
import time
import simplejson as json

blob = json.loads(sys.stdin.read())

for prob in blob['problems']:
    os.system('.cabal-sandbox/bin/icfpc2016-zhmppxm ' + ' <probs/' + str(prob['problem_id']) + '-' + prob['problem_spec_hash'] + '.txt' + ' >sols/' + str(prob['problem_id']) + '.txt')
    os.system('shell/sol-submit.sh ' + str(prob['problem_id']) + ' sols/' + str(prob['problem_id']) + '.txt')
    time.sleep(5)

sys.exit(0)

