flatcar_base : config/flatcar_base/flatcar_base.json
	docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar_base/flatcar_base.yaml > out/flatcar_base.json

flatcar : config/flatcar_base/flatcar_base.json config/flatcar/flatcar.json
	docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd < config/flatcar/flatcar.yaml > out/flatcar.json