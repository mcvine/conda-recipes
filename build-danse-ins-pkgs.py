#!/usr/bin/env python

import os

pkgs = 'danse.ins bpext dsm matter numpyext journal pyre histogram drchops'
pkgs = pkgs.split()

for pkg in pkgs:
  cmd = './build.py danse-inelastic %s' % pkg
  print cmd
  os.system(cmd)
