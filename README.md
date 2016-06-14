# conda-recipes
Recipes to build conda packages for mandatory and optional dependencies of mcvine, and mcvine itself

## Create a conda release for MCViNE
For any package, first update the release tag, then build conda package.

Update in this sequence:
* DANSE dependencies
* Mantid
* MCViNE

## Deployments at SNS analysis cluster

conda environments:
* "mcvine": latest release
* "mcvine-<version>": the specific mcvine version
