#!/usr/bin/env python

name = "danse.ins"
version = "" or "0.1"
git_revision = "" or ('v'+version)
git_clone_url = "https://github.com/danse-inelastic/danse.ins.git"

build_deps = "python".split()
build_deps.append('cmake')
run_deps = "python".split()

build_requirements = '\n'.join("    - %s" % d for d in build_deps)
run_requirements = '\n'.join("    - %s" % d for d in run_deps)

import_test = "" or "danse.ins"
test_script = ""
home_url = ""

template = open("meta.yaml.template").read()
content = template % locals()
open("meta.yaml", 'wt').write(content)
