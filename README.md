# action-gitops

Provides standard GitOps on a Kustomize Environment overlay with GitHub Actions.
Intended to be run by a bot in order to allow DevOps teams to perform Ops quickly
and easily via automated PRs with reduced review requirements for common operations
like scaling replicas.

## Usage

### Pre-requisites

- Github repo where your Kustomize deployment files reside e.g. [kustomize-everything/guestbook-deploy](https://github.com/kustomize-everything/guestbook-deploy)

### Inputs

Refer to [action.yml](./action.yml)

### Outputs

Refer to [action.yml](./action.yml)

### Example Workflow

```yaml
---
name: Ops
on:
  workflow_dispatch:
    inputs:
      service-name:
        description: 'Service Name'
        type: choice
        options:
          - my-service
        required: true
      replicas:
        description: 'Desired Number of Replicas'
        required: true
      environment:
        description: 'Environment'
        type: choice
        options:
          - integration
          - staging
          - production
        default: 'integration'
        required: true
      replica-selector:
        description: 'Replica Selector (defaults to Service Name if not provided)'
        required: false

jobs:
  op:
    name: Adjust Replicas for Service
    runs-on: ubuntu-latest
    steps:
      - name: Open PR to Adjust Replicas
        uses: kustomize-everything/action-gitops@main
        with:
          service-name: ${{ github.event.inputs.service-name }}
          selector: ${{ github.event.inputs.replica-selector }}
          environment:
```

## Contributing

We would love for you to contribute to kustomize-everything/actions-env-build-and-deploy, pull requests are welcome!

## License

The scripts and documentation in this project are released under the [MIT License](LICENSE).
