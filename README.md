# Image Environment Deploy Trixie Slim

Deploy environment image containing `kaptain-deploy-scripts` built on top of an
in-house Debian Trixie Slim base image with kubectl and other tools included.


## Versioning

Uses compound version calculation from two upstream sources:

| Description | Image                                | Prefix Parts | Example      |
|-------------|--------------------------------------|--------------|--------------|
| ONE         | kaptain-deploy-scripts               | 3            | 1.0.0        |
| TWO         | image-environment-base-trixie-slim   | 2            | 1.32         |
| Full result | image-environment-deploy-trixie-slim | 5            | 1.0.0.1.32.X |

Output version format: `<kaptainDeployScripts>.<trixieBaseImage>.<increment>`

Example: `1.0.0.1.32.1` means:
- kaptain-deploy-scripts 1.0.0
- image-environment-base-trixie-slim 1.32.X with matching 1.32.Y kubectl inside
- auto incrementing patch versions starting at 1


## Usage

This image is designed to be used by the Kaptain build system in an environment
specific build type once such a thing exists. It relies on the behaviour of that 
build to function correctly in use. See `src/docker/Dockerfile` for more info. 


## Updating Upstream Versions

Edit `src/docker/Dockerfile` and update the FROM lines:
- `kaptain-deploy-scripts:X.Y.Z` - deploy scripts version
- `image-environment-base-trixie-slim:X.Y.Z` - base image version

The build will auto-increment the final version part to match these.
