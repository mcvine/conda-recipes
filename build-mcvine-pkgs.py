#!/usr/bin/env python

import os

pkgs = 'resources mcvine'
pkgs = pkgs.split()

for pkg in pkgs:
  cmd = './build.py mcvine %s' % pkg
  print cmd
  os.system(cmd)
