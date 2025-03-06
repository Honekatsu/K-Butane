#

```bash
cat <source.yaml> | docker run -i --rm quay.io/coreos/butane:release > <dest.json>
```

## flatcar

```bash
cat flatcar.yaml | docker run -i --rm -v ${PWD}:/pwd quay.io/coreos/butane:release --files-dir /pwd > flatcar.json
```

## Flatcar_loki

```bash
cat flatcar_loki.yaml | docker run -i --rm -v ${PWD}:/pwd quay.io/coreos/butane:release --files-dir /pwd > flatcar_loki.json
```

## Flatcar_harbor

```bash
cat flatcar_harbor.yaml | docker run -i --rm -v ${PWD}:/pwd quay.io/coreos/butane:release --files-dir /pwd > flatcar_harbor.json
```
