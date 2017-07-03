## Setup build env
```
$ . ~/.use-miniconda2
$ . ~/.build-mcvine-in-conda
```

## Build
* cd into mcvine conda-recipes
* modify version number in meta.yaml
* run `$ conda build .`

## Install
Normal install 
```
$ conda create -n mcvine-1.1.08172016 python
$ source activate mcvine-1.1.08172016
$ conda install --use-local mcvine=1.1.08172016
```

Reinstall mpi4py
```
$ conda remove mpi4py mpich2
$ # download mpi4py-2.0 to ~/downloads
$ cd ~/downloads
$ tar xvfz mpi4py-2.0.0.tar.gz
$ cd mpi4py-2.0.0
$ python setup.py build
$ python setup.py install
```
Test mpi4py
```
$ salloc -N 1 -p debug
$ srun -n 3 python -c "from mpi4py import MPI; print MPI.COMM_WORLD.Get_rank()
$ exit
```
It should prints out a random sequence of 012.

Install mcvine again
```
$ conda install ~/conda/miniconda2/conda-bld/linux-64/mcvine-1.1.08172016-py27_0.tar.bz2
```

Create new env vars script ~/.use-mcvine-1.1.08172016-in-conda:
```
export PATH="/scratch2/scratchdirs/linjiao/conda/miniconda2/bin:$PATH"
source activate mcvine-1.1.08172016
module swap PrgEnv-intel PrgEnv-gnu
module remove gcc
module load gcc/5.2.0
module load openmpi-ccm/1.10.2
export MCVINE_MPI_LAUNCHER=slurm
```