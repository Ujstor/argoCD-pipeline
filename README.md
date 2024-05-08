# GitHub Actions Workflow for ArgoCD CICD pipeline

![pipline](public/pipeline.png)

Repo for Github Actions that integrates with DockerHub and ArgoCD

## Docker Tag

Dependencies:
- [yq](https://github.com/mikefarah/yq)
- [jq](https://github.com/jqlang/jq)

Variables are defined in `config.yml` and can be updated upon commit for new image tag:

```yaml
docker:
  DOCKER_HUB_USERNAME:  
  DOCKER_REPO_NAME:
  VERSION_PART:  # Patch, Minor, Major
```
If the image does not exist, the default image tag is 0.0.1. Semantic versioning is employed upon commit, automatically incrementing the version

Workflow also requires DockerHub login credentials, username and password configuration in the Action secret:

```yaml
username: ${{ secrets.DOCKERHUB_USERNAME }}
password: ${{ secrets.DOCKERHUB_TOKEN }}
```
