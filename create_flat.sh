echo "pwd: ${PWD}"
set -e
cat flat_base.yaml | docker run -i --rm -v ${PWD}:/pwd quay.io/coreos/butane:release --files-dir /pwd > flat_base.json
cat flat.yaml | docker run -i --rm -v ${PWD}:/pwd quay.io/coreos/butane:release --files-dir /pwd > flat.json