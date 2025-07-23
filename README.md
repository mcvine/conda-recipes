# conda-recipes
Recipes to build conda packages for mandatory and optional dependencies of mcvine, and mcvine itself. These are the production packages and must be manually deployed after building, as deployment does not happen automatically. 

## Create a conda release for MCViNE
For any package, first create the release tag in the associated repository, then update the tag version/commit Id in the conda-recipe here, then build conda package.

Be sure to switch to the shared environment if you are building any package except for mcvine.acc. To build the specific package, go to the directory where the meta.yml file exists and run this command:

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
