#!/bin/bash

# Download Avalanche CLI
curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s -- -b . v1.2.1

# Download Ash CLI (+ verify checksum)
curl -sSfL https://github.com/AshAvalanche/ash-rs/releases/download/v0.2.1/ash-linux-amd64-v0.2.1 -o ash-linux-amd64-v0.2.1
curl -sSfL https://github.com/AshAvalanche/ash-rs/releases/download/v0.2.1/ash-linux-amd64-v0.2.1.sha512 | sha512sum -c --quiet
mv ash-linux-amd64-v0.2.1 ash && chmod +x ash

# Download tokenvm and token-cli (+ verify checksum)
curl -sSfL https://github.com/ava-labs/hypersdk/releases/download/v0.0.7/hypersdk_0.0.7_linux_amd64.tar.gz -o hypersdk_0.0.7_linux_amd64.tar.gz
curl -sSfL https://github.com/ava-labs/hypersdk/releases/download/v0.0.7/hypersdk_0.0.7_checksums.txt | sha256sum -c --ignore-missing --quiet
tar -xzf hypersdk_0.0.7_linux_amd64.tar.gz --wildcards 'token*' && chmod +x token*
rm hypersdk_0.0.7_linux_amd64.tar.gz

# Download jq
curl -sSfL https://github.com/jqlang/jq/releases/download/jq-1.6/jq-linux64 -o jq && chmod +x jq

# Create directory for tokenvm profiles
mkdir -p /tmp/tokenvm-e2e-profiles
