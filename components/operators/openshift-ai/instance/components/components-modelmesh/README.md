# components-serving

## Purpose
This component is designed help configure the serving specific components including the following items:

ModelMesh

Warning: ModelMesh is depreciated as of 2.19.

## Usage

This component can be added to a base by adding the `components` section to your overlay `kustomization.yaml` file:

```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
  - ../../base

components:
  - ../../components/components-modelmesh
```
