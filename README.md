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
  VERSION_PART:  # Patch, Minor, major
```
If the image does not exist, the default image tag is 0.0.1. Semantic versioning is employed upon commit, automatically incrementing the version

Workflow also requires DockerHub login credentials, username and password configuration in the Action secret:

```yaml
username: ${{ secrets.DOCKERHUB_USERNAME }}
password: ${{ secrets.DOCKERHUB_TOKEN }}
```

## Update Helm chart repo

Under helm values in config.yml, define REPO (user/repo-name) and CHART name:

```yaml
github-helm-repo:
  REPO: 
  CHART:
```
If CI and Docker image push to Docker Hub workflows are successful, the update repo workflow will be triggered, updating the deployment image tag with the latest tag. Actions require write access and a generated Personal Access Token to have the ability to push to another GitHub Repository.

```yaml
   token: ${{ secrets.PAT }}
```

This is a proof of conceptm, workflow can be improved to match the requirements of individual use cases.

Check [Repository](https://github.com/Ujstor/argoCD-test-helm) with the Helm chart that is updated on changes.
