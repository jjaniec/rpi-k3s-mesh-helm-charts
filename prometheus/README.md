# Prometheus

``bash
# Get Repo Info
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

ENV='lvb1'
NAMESPACE="tooling"
VERSION="34.1.1"

# Installing the chart manually
helm upgrade --install --version "${VERSION}" prometheus -n "${NAMESPACE}" prometheus-community/kube-prometheus-stack -f "values.${ENV}.yaml"
```
