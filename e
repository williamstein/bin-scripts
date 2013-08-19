#!/usr/bin/env python

import os, sys, time

def run(cmd):
    return os.system(cmd)

if sys.platform.startswith('linux'):
    args = ' '.join(sys.argv[1:])
    cmd = 'emacs -no-splash -geometry 86x40+276+25 %s 2>/dev/null&'%args
    #cmd = "emacs -nw " + args
    run(cmd)

elif sys.platform == 'darwin':

    if len(sys.argv) > 1:
        for X in sys.argv[1:]:
            if not os.path.exists(X):
                open(X,'w').close()
                
    args = ' '.join([os.path.abspath(x) for x in sys.argv[1:]])
    cmd = '/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n %s 2>/dev/null'%args
    while True:
        if not run(cmd): break
        run('open -a Emacs.app 2>/dev/null ')
        time.sleep(1)

else:
    print("Unknown platform %s"%sys.platform)

