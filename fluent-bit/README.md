# Fluent-bit

```bash
NAMESPACE=tooling
ENV=lvb1

helm repo add fluent https://fluent.github.io/helm-charts
helm secrets upgrade --install -n "${NAMESPACE}" --create-namespace fluent-bit fluent/fluent-bit -f "values.${ENV}.yaml" -f "secrets.${ENV}.yaml"
```
