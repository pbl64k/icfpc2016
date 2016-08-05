#!/usr/bin/env python

import sys
import os
import time
import simplejson as json

blob = json.loads(sys.stdin.read())

for prob in blob['problems']:
    print prob['problem_id'], prob['problem_spec_hash']
    os.system('shell/blob.sh ' + prob['problem_spec_hash'] + ' >probs/' + str(prob['problem_id']) + '-' + prob['problem_spec_hash'] + '.txt')
    time.sleep(5)

sys.exit(0)

