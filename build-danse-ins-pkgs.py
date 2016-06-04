#!/usr/bin/env python

import os

pkgs = 'danse.ins bpext dsm matter numpyext journal pyre histogram drchops'
pkgs = pkgs.split()

for pkg in pkgs:
  cmd = 'git clone git@github.com:danse-inelastic/%s' % pkg
  os.system(cmd)
  cmd = 'cd %s; mkdir -p build; cd build; rm -rf *; cmake .. ; make conda-build-pkg' % pkg
  print cmd
  os.system(cmd)
