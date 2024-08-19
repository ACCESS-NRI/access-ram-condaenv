# access-ram-condaenv

This repository is created taking [payu-condaenv](https://github.com/ACCESS-NRI/payu-condaenv) as a reference.

## Overview

This repository is responsible for building, packaging and deploying the environment needed to run the [replace_landsurface](https://github.com/ACCESS-NRI/replace_landsurface) python scripts, as part of [ACCESS-RAM3](https://github.com/ACCESS-NRI/ACCESS-RAM3).
This environment is created as a [`micromamba` environment](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html).

## Usage

### Triggering a Deployment

In order to trigger a deployment, the following steps must be followed:

- Open a PR modifying the `env.yml` file.
- The `env.yml` will be checked for validity.
- When the PR is merged, the `env.yml` will be used to create a `micromamba` environment. This is then packaged using `conda-pack`, and deployed to the appropriate targets (eg. Gadi).

### Using the Deployed Environment

On all of the deployment targets, the deployed environment can be activated using Environment Modules.

#### Gadi

1. Make sure you're a member of the `<PROJECT_TO_BE_DEFINED>` project! If not, see [how to join an NCI project](https://access-hive.org.au/getting_started/first_steps/#join-relevant-nci-projects).
   > [!IMPORTANT]
   > Make sure you do not have another conda environment active: either run `conda deactivate` or `module unload` any modules that are using conda.

2. Once you are a member, run the following:

   ```bash
   module use /g/data/vk83/modules
   module load conda/access-ram3/<VERSION>
   ```

You are set to run ACCESS-RAM3.

## Notes

### On Future Deployment Environments

New deployment environments must be created as a GitHub Environment and also have an entry in the [`config/deployment-environment.json`](https://github.com/ACCESS-NRI/access-ram-condaenv/blob/main/config/deployment-environment.json) file.

### Deploying locally

To deploy locally, you can use the assets created in the release. [Releases are found here](https://github.com/ACCESS-NRI/access-ram-condaenv/releases). Specifically:

- To use the compressed environment (which doesn't require conda or python) you can run `tar -xzf access-ram-<VERSION>.tar.gz access-ram` and then `./access-ram/bin/activate` to activate the environment.
- To use the lockfile, you can run `micromamba create -n environment-name -f access-ram.conda-lock.yml` with an appropriate install of `micromamba`.
