#!/usr/bin/env python

import os, sys

args = ' '.join(sys.argv[1:])

if sys.platform.startswith('linux'):
    cmd = 'emacs -geometry 86x40+276+25 %s &'%args

elif sys.platform == 'darwin':

    if len(sys.argv) > 1:
        for X in sys.argv[1:]:
            if not os.path.exists(X):
                open(X,'w').close()

    cmd = 'open -a Emacs.app %s 2>/dev/null &'%args

else:
    print("Unknown platform %s"%sys.platform)

print(cmd)
os.system(cmd)
