#!/usr/bin/env python

import os, sys

repo = sys.argv[1]
pkg = sys.argv[2]

cmd = 'git clone git@github.com:%s/%s' % (repo, pkg)
os.system(cmd)
cmd = 'cd %s; mkdir -p build; cd build; rm -rf *; cmake .. ; make conda-build-pkg' % pkg
print cmd
os.system(cmd)
