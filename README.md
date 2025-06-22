# Butaneマニフェストファイル

## Ignition用JSONの生成

一括生成

```bash
make
```

### Flatcar

```bash
make out/flatcar.json
```

### Flatcar_net(CoreDNS, Traefik, HAProxy)

```bash
make out/flatcar_net01.json
make out/flatcar_net02.json
```

### flatcar_prometheus(Prometheus, Grafana, Loki, MiniO)

```bash
make out/flatcar_prometheus.json
```

### Flatcar_harbor(Docker Registry)

```bash
make out/flatcar_harbor.json
```

証明書の生成周りはObsidian参照(Private)

### Flatcar_forgejo(Gitサーバー Forgejo, PostgreSQL, MinIO, LLDAP)

```bash
make out/flatcar_forgejo.json
```
