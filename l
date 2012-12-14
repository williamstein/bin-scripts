#!/usr/bin/env python

import os, sys

if len(sys.argv) == 1:
    v = list(sorted([(-os.path.getmtime(X),X) for X in os.listdir('.') if X.endswith('.tex') and not X.startswith('.') and 'documentclass' in open(X).read()]))
    if len(v) == 0:
        sys.exit(1)
    sys.argv.append(v[0][1])

file = os.path.splitext(sys.argv[1])[0]

cmd = 'pdflatex -synctex=1 -interaction=nonstopmode "\input" %s.tex'%file
print cmd
#cmd = 'pdflatex -synctex=1 "\input" %s.tex'%file
os.system(cmd)

#cmd = 'open %s.pdf'%file
#os.system(cmd)
