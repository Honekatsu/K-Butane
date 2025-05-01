#!/usr/bin/env bash
set -e

export $(xargs < /home/flatcar/.prometheus/.env)
envsubst  < /home/flatcar/.prometheus/data/prometheus.yml.template >  /home/flatcar/.prometheus/data/prometheus.yml