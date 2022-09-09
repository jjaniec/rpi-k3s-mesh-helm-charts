# metrics-server

```bash
ENV=lvb1
NAMESPACE='tooling'

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/

helm secrets upgrade --install -n "${NAMESPACE}" --create-namespace metrics-server metrics-server/metrics-server -f values.${ENV}.yaml
```
