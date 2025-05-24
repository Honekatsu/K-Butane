BUTANE_CMD = docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd

#targets
all: out/flatcar_base.json out/flatcar.json out/flatcar_prometheus.json out/flatcar_net_base.json out/flatcar_net01.json out/flatcar_net02.json out/flatcar_forgejo.json out/flatcar_db01.json out/flatcar_harbor.json

# Flatcar base configuration
FC_base_path = config/flatcar_base
FC_base_out = out/flatcar_base.json
out/flatcar_base.json : $(FC_base_path)/flatcar_base.yaml $(FC_base_path)/authorized_keys $(FC_base_path)/ca.crt
	$(BUTANE_CMD) < $(FC_base_path)/flatcar_base.yaml > out/flatcar_base.json
	@echo "✅ create out/flatcar_base.json"

# Flatcar docker
FC_docker_path = config/flatcar_docker
out/flatcar.json : $(FC_base_out) config/flatcar_docker/flatcar.yaml
	$(BUTANE_CMD) < $(FC_docker_path)/flatcar.yaml > out/flatcar.json
	@echo "✅ create out/flatcar.json"

# Flatcar prometheus
FC_prometheus_path = config/flatcar_prometheus
out/flatcar_prometheus.json : $(FC_base_out) $(FC_prometheus_path)/flatcar_prometheus.yaml $(FC_prometheus_path)/prometheus/create_config.sh $(FC_prometheus_path)/prometheus/prometheus.yml.template
	$(BUTANE_CMD) < $(FC_prometheus_path)/flatcar_prometheus.yaml > out/flatcar_prometheus.json
	@echo "✅ create out/flatcar_prometheus.json"

# Flatcar net
FC_net_path = config/flatcar_net
out/flatcar_net_base.json : $(FC_base_out) $(FC_net_path)/flatcar_net_base.yaml $(FC_net_path)/coredns/Corefile01 $(FC_net_path)/coredns/Corefile02 $(FC_net_path)/haproxy/haproxy.cfg $(FC_net_path)/traefik/traefik.yml $(FC_net_path)/traefik/external_service.yml
	$(BUTANE_CMD) < $(FC_net_path)/flatcar_net_base.yaml > out/flatcar_net_base.json
	@echo "✅ create out/flatcar_net_base.json"

out/flatcar_net01.json : $(FC_base_out) out/flatcar_net_base.json $(FC_net_path)/flatcar_net01.yaml
	$(BUTANE_CMD) < $(FC_net_path)/flatcar_net01.yaml > out/flatcar_net01.json
	@echo "✅ create out/flatcar_net01.json"

out/flatcar_net02.json : $(FC_base_out) out/flatcar_net_base.json $(FC_net_path)/flatcar_net02.yaml
	$(BUTANE_CMD) < $(FC_net_path)/flatcar_net02.yaml > out/flatcar_net02.json
	@echo "✅ create out/flatcar_net02.json"

# Flatcar forgejo
FC_forgejo_path = config/flatcar_forgejo
out/flatcar_forgejo.json : $(FC_base_out) $(FC_forgejo_path)/flatcar_forgejo.yaml
	$(BUTANE_CMD) < $(FC_forgejo_path)/flatcar_forgejo.yaml > out/flatcar_forgejo.json
	@echo "✅ create out/flatcar_forgejo.json"

# Flatcar db01
FC_db01_path = config/flatcar_db01
out/flatcar_db01.json : $(FC_base_out) $(FC_db01_path)/flatcar_db01.yaml $(FC_db01_path)/couchdb-obsidian/default.ini
	$(BUTANE_CMD) < $(FC_db01_path)/flatcar_db01.yaml > out/flatcar_db01.json
	@echo "✅ create out/flatcar_db01.json"

# Flatcar harbor
FC_harbor_path = config/flatcar_harbor
out/flatcar_harbor.json : $(FC_base_out) $(FC_harbor_path)/flatcar_harbor.yaml $(FC_harbor_path)/harbor.yml
	$(BUTANE_CMD) < $(FC_harbor_path)/flatcar_harbor.yaml > out/flatcar_harbor.json
	@echo "✅ create out/flatcar_harbor.json"