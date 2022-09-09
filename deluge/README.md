helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install deluge k8s-at-home/deluge -f values.yaml

