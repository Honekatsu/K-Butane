#!/usr/bin/env bash
set -e

export $(xargs < /home/flatcar/.prometheus/.env)
envsubst  < /home/flatcar/.prometheus/prometheus.yml.template >  /home/flatcar/.prometheus/config/prometheus.yml