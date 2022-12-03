# rpi-mesh-helm-charts

```bash
ENV=lvb1

helmfile --file "helmfile.${ENV}.yaml" deps
helmfile --file "helmfile.${ENV}.yaml" sync --skip-deps
```
