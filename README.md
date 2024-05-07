# GitHub Actions for ArgoCD CICD pipeline

![pipline](public/pipeline.png)

Repo for Github Actions that integrates with DockerHub and ArgoCD

## Docker Tag

Dependencies:
- [yq](https://github.com/mikefarah/yq)
- [jq](https://github.com/jqlang/jq)

variables are defined in `config.yml`

```yaml
docker:
  DOCKER_HUB_USERNAME:  
  DOCKER_REPO_NAME:
  VERSION_PART:  # Patch, Minor, Major
```

Default image tag if image does not exist is 0.0.1
On commit semantic versioning is used and the version is autmatically incremented
