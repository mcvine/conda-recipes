# conda-recipes
Recipes to build conda packages for mandatory and optional dependencies of mcvine, and mcvine itself. The packages must be manually deployed after building, deployment does not happen automatically. 

## Create a conda release for MCViNE
For any package, first update the release tag, then build conda package.

To build the specific package, go to the directory where the meta.yml file exists and run this command:

```console
conda build .
```

Update in this sequence:
* DANSE dependencies
* Mantid (should use recipe in mantidproject/conda-recipes if possible)
* MCViNE

## Deployments at SNS analysis cluster

conda environments:
* "mcvine": latest release
* "mcvine-{version}": the specific mcvine version
