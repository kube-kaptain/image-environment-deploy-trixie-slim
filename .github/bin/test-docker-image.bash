#!/usr/bin/env bash
# SPDX-License-Identifier: CC-BY-SA-4.0
# Copyright (c) 2025-2026 Kaptain contributors (Fred Cooke)
#
# Test the built Docker image by running the validate-tooling script.

set -euo pipefail

IFS=',' read -ra platforms <<< "${DOCKER_PLATFORM}"
for platform in "${platforms[@]}"; do
  platform_suffix="${platform//\//-}"
  test_image="${DOCKER_IMAGE_FULL_URI}-${platform_suffix}"
  echo "Testing image: ${test_image}"
  docker run --rm "${test_image}" /kd/bin/validate-tooling
  echo "Image validation passed for ${platform}"
done
