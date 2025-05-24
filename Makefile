flatcar_base : config/flatcar_base/flatcar_base.yaml
	docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar_base/flatcar_base.yaml > out/flatcar_base.json

flatcar : config/flatcar_base/flatcar_base.yaml config/flatcar_docker/flatcar.yaml
	docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar_docker/flatcar.yaml > out/flatcar.json