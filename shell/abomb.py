#!/usr/bin/env python

import sys
import os
import time
import simplejson as json

while True:
    print 'Reading snapshot information...'
    
    ssp = os.popen('shell/snapshot.sh', 'r')
    ssbl = json.loads(ssp.read())
    ssp.close()
    
    sn_time = None
    sn_hash = None
    
    for sn_info in ssbl['snapshots']:
        if sn_time is None or sn_time < sn_info['snapshot_time']:
            sn_time = sn_info['snapshot_time']
            sn_hash = sn_info['snapshot_hash']
    
    print 'Latest snapshot:', sn_hash, sn_time

    print 'Sleeping...'

    time.sleep(5)
    
    print 'Reading snapshot...'
    
    sssp = os.popen('shell/blob.sh ' + sn_hash, 'r')

    ss = ''
    while True:
        s = sssp.read()
        if s != '':
            ss += s
        else:
            break

    #print ss
    blob = json.loads(ss)
    sssp.close()
    
    for prob in blob['problems']:
        pr_id = prob['problem_id']
        pr_hash = prob['problem_spec_hash']
        pr_fn = 'probs/' + str(pr_id) + '-' + pr_hash + '.txt'
        sol_fn = 'sols/' + str(pr_id) + '.txt'

        print 'Problem', pr_id, pr_hash

        if not os.path.isfile(pr_fn):
            print 'Downloading...'
            os.system('shell/blob.sh ' + prob['problem_spec_hash'] + ' >' + pr_fn)
            print
            print 'Done, sleeping.'
            time.sleep(5)
        else:
            print 'Problem already downloaded.'

        if not os.path.isfile(sol_fn):
            print 'Solving...'
            os.system('.cabal-sandbox/bin/icfpc2016-zhmppxm ' + ' <' + pr_fn + ' >' + sol_fn)
            print 'Submitting...'
            os.system('shell/sol-submit.sh ' + str(prob['problem_id']) + ' sols/' + str(prob['problem_id']) + '.txt')
            print
            print 'Done, sleeping.'
            time.sleep(5)

    print 'Did a lot of work, sleeping...'
    time.sleep(300)

sys.exit(0)

