## Install miniconda
```
$ wget http://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh
$ chmod +x miniconda.sh 
$ ./miniconda.sh 
```
installed to ~/conda/miniconda2

## Set up environment variables script
added ~/.use-miniconda2:
```
  module swap PrgEnv-intel PrgEnv-gnu
  module remove gcc
  module load gcc/5.2.0
  export PATH="/global/homes/l/linjiao/conda/miniconda2/bin:$PATH"
```
logout/login again

## Prepare conda env
```
$ . ~/.use-miniconda2
$ conda config  --add channels conda-forge
$ conda create -n mcvine python
$ conda install -n root conda-build

$ # need to do this so that cmake can pick up the correct cc and cxx
$ export CC=/opt/gcc/5.2.0/bin/gcc
$ export CXX=/opt/gcc/5.2.0/bin/g++
```

## Run conda recipes
```
$ cd ~/scratch2/mcvine
```
First boost
```
$ git clone git@github.com:conda-forge/boost-feedstock
$ conda build boost-feedstock/recipe
```
Then danse
```
$ cd conda-recipes
```
Run $ conda build danse/PKG for the following
  - danse.ins
  - bpext
  - numpyext
  - dsm
  - journal
  - pyre
  - histogram
  - matter
  - drchops

Or in just one line:
    cd danse; conda build danse.ins bpext numpyext dsm journal pyre histogram matter drchops

Finally mcvine
```
$ cd ~/scratch2/mcvine/conda-recipes
$ conda build mcvine-resources mcvine
```

## mpi4py
The mpi4py installed from conda-forge channel does not work.
Had to the following:

* remove mpi4py, mpich2, and also mcvine (because it depends on mpi4py)
* load openmpi module: `$ module load openmpi-ccm/1.10.2`
* build mpi4py from scratch: download, expand, and run `$ python setup.py install`
* install mcvine by directly pointing to the path of the pkg: `$ conda install ~/conda/miniconda2/conda-bld/linux-64/mcvine-1.1-py27_0.tar.bz2`, which ignore installation of dependencies (otherwise the newly installed mpi4py will be replaced by the conda mpi4py)

