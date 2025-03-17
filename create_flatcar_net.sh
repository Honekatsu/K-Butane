#!/bin/sh
set -e

echo "pwd: ${PWD}"
docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar_base/flatcar_base.yaml > out/flatcar_base.json
echo "✅ create out/flatcar_base.json"

docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar_net/flatcar_net_base.yaml > out/flatcar_net_base.json
echo "✅ create out/flatcar_net_base.json"

docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar_net/flatcar_net01.yaml > out/flatcar_net01.json
echo "✅ create out/flatcar_net01.json"

docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar_net/flatcar_net02.yaml > out/flatcar_net02.json
echo "✅ create out/flatcar_net02.json"