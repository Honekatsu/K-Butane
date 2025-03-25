#!/bin/sh
set -e

echo "pwd: ${PWD}"
docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar_base/flatcar_base.yaml > out/flatcar_base.json
echo "✅ create out/flatcar_base.json"

docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar_forgejo/flatcar_forgejo.yaml > out/flatcar_forgejo.json
echo "✅ create out/flatcar_forgejo.json"