#!/bin/sh
set -e

echo "pwd: ${PWD}"
docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < flatcar_base.yaml > flatcar_base.json
docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < flatcar_loki.yaml > flatcar_loki.json