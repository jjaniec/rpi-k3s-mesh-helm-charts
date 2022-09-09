# ddns-updater

```bash
ENV=lvb1

helm secrets upgrade --install ddns-updater . -f values.${ENV}.yaml -f secrets.${ENV}.yaml
```
