#

```bash
cat <source.yaml> | docker run -i --rm quay.io/coreos/butane:release > <dest.json>
```

```bash
cat flatcar.yaml | docker run -i --rm -v ${PWD}:/pwd quay.io/coreos/butane:release --files-dir /pwd > flatcar.json
```
