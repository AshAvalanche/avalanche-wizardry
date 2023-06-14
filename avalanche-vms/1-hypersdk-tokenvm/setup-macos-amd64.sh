#!/bin/bash

# Install Avalanche CLI
curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s -- -b . v1.2.1

# Download Ash CLI (+ verify checksum)
curl -sSfL https://github.com/AshAvalanche/ash-rs/releases/download/v0.2.1/ash-macos-amd64-v0.2.1.tar.gz -o ash-macos-amd64-v0.2.1.tar.gz
curl -sSfL https://github.com/AshAvalanche/ash-rs/releases/download/v0.2.1/ash-macos-amd64-v0.2.1.tar.gz.sha512 | sha512sum -c --quiet
tar -xzf ash-macos-amd64-v0.2.1.tar.gz && chmod +x ash
rm ash-macos-amd64-v0.2.1.tar.gz

# Download tokenvm and token-cli (+ verify checksum)
curl -sSfL https://github.com/ava-labs/hypersdk/releases/download/v0.0.7/hypersdk_0.0.7_darwin_amd64.tar.gz -o hypersdk_0.0.7_darwin_amd64.tar.gz
curl -sSfL https://github.com/ava-labs/hypersdk/releases/download/v0.0.7/hypersdk_0.0.7_checksums.txt | sha256sum -c --ignore-missing --quiet
tar -xzf hypersdk_0.0.7_darwin_amd64.tar.gz --wildcards 'token*' && chmod +x token*
rm hypersdk_0.0.7_darwin_amd64.tar.gz

# Download jq
curl -sSfL https://github.com/jqlang/jq/releases/download/jq-1.6/jq-osx-amd64 -o jq && chmod +x jq

# Create directory for tokenvm profiles
mkdir -p /tmp/tokenvm-e2e-profiles
