BUTANE_CMD = docker run -i --rm -v "${PWD}":/pwd quay.io/coreos/butane:release --files-dir /pwd

#targets
all: out/flatcar_base.json out/flatcar.json out/flatcar_prometheus.json out/flatcar_net_base.json out/flatcar_net01.json out/flatcar_net02.json out/flatcar_forgejo.json out/flatcar_db01.json out/flatcar_harbor.json

.PHONY: all

# Flatcar base configuration
FC_base_path = config/flatcar_base
FC_base_out = out/flatcar_base.json
out/flatcar_base.json : $(FC_base_path)/flatcar_base.yaml $(FC_base_path)/authorized_keys $(FC_base_path)/ca.crt
	$(BUTANE_CMD) < $< > $@
	@echo "✅ create $@"

# Flatcar docker
FC_docker_path = config/flatcar_docker
out/flatcar.json : config/flatcar_docker/flatcar.yaml $(FC_base_out)
	$(BUTANE_CMD) < $< > $@
	@echo "✅ create $@"

# Flatcar prometheus
FC_prometheus_path = config/flatcar_prometheus
out/flatcar_prometheus.json : $(FC_prometheus_path)/flatcar_prometheus.yaml $(FC_base_out) $(FC_prometheus_path)/prometheus/create_config.sh $(FC_prometheus_path)/prometheus/prometheus.yml.template
	$(BUTANE_CMD) < $< > $@
	@echo "✅ create $@"

# Flatcar net
FC_net_path = config/flatcar_net
out/flatcar_net_base.json : $(FC_net_path)/flatcar_net_base.yaml $(FC_base_out) $(FC_net_path)/coredns/Corefile01 $(FC_net_path)/coredns/Corefile02 $(FC_net_path)/haproxy/haproxy.cfg $(FC_net_path)/traefik/traefik.yml $(FC_net_path)/traefik/external_service.yml
	$(BUTANE_CMD) < $< > $@
	@echo "✅ create $@"

out/flatcar_net01.json : $(FC_net_path)/flatcar_net01.yaml $(FC_base_out) out/flatcar_net_base.json
	$(BUTANE_CMD) < $< > $@
	@echo "✅ create $@"

out/flatcar_net02.json : $(FC_net_path)/flatcar_net02.yaml $(FC_base_out) out/flatcar_net_base.json
	$(BUTANE_CMD) < $< > $@
	@echo "✅ create $@"

# Flatcar forgejo
FC_forgejo_path = config/flatcar_forgejo
out/flatcar_forgejo.json : $(FC_forgejo_path)/flatcar_forgejo.yaml $(FC_base_out)
	$(BUTANE_CMD) < $< > $@
	@echo "✅ create $@"

# Flatcar db01
FC_db01_path = config/flatcar_db01
out/flatcar_db01.json : $(FC_db01_path)/flatcar_db01.yaml $(FC_base_out) $(FC_db01_path)/couchdb-obsidian/default.ini
	$(BUTANE_CMD) < $< > $@
	@echo "✅ create $@"

# Flatcar harbor
FC_harbor_path = config/flatcar_harbor
out/flatcar_harbor.json : $(FC_harbor_path)/flatcar_harbor.yaml $(FC_base_out) $(FC_harbor_path)/harbor.yml
	$(BUTANE_CMD) < $< > $@
	@echo "✅ create $@"