#!/usr/bin/env python

#emacs -geometry 86x40+276+25 $@ 2>/dev/null

import os, sys

if len(sys.argv) > 1:
   for X in sys.argv[1:]:
      if not os.path.exists(X):
         open(X,'w').close()

#cmd = 'open -a Emacs.app -n %s 2>/dev/null &'%(' '.join(sys.argv[1:]))
cmd = 'open -a Emacs.app %s 2>/dev/null &'%(' '.join(sys.argv[1:]))
print cmd
os.system(cmd)
