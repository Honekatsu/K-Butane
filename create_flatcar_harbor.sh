#!/bin/sh
set -e

echo "pwd: ${PWD}"
docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar_base/flatcar_base.yaml > out/flatcar_base.json
docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar_harbor/flatcar_harbor.yaml > out/flatcar_harbor.json