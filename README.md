# Butaneマニフェストファイル

## Ignition用JSONの生成

### Flatcar

```bash
sh create_flatcar.sh
```

### Flatcar_loki(Loki & MiniO)

```bash
sh create_flatcar_loki.sh
```

[Loki設定ファイル](https://github.com/Honekatsu/K-Loki)

### Flatcar_harbor(Docker Registry)

```bash
sh create_flatcar_harbor.sh
```

証明書の生成周りはObsidian参照(Private)

### Flatcar_forgejo(Gitサーバー)

```bash
sh create_flatcar_forgejo.sh
```
