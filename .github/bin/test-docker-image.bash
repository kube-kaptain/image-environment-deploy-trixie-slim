#!/usr/bin/env bash
# SPDX-License-Identifier: CC-BY-SA-4.0
# Copyright (c) 2025-2026 Kaptain contributors (Fred Cooke)
#
# Test the built Docker image by running the validate-tooling script.

set -euo pipefail

echo "Testing image: ${DOCKER_IMAGE_FULL_URI}"

docker run --rm "${DOCKER_IMAGE_FULL_URI}" /run/bin/validate-tooling

echo "Image validation passed"
