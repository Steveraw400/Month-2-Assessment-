#!/bin/bash
set -e

docker build \
  -t muchtodo-app \
  -f much-to-do/Dockerfile \
  much-to-do

