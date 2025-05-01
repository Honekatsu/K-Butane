#!/usr/bin/env bash
set -e

export $(cat /home/flatcar/.prometheus/.env | xargs)
envsubst  < /home/flatcar/.prometheus/data/prometheus.yml.template >  /home/flatcar/.prometheus/data/prometheus.yml