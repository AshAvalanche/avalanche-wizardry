#!/bin/bash

# Install Avalanche CLI
curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s -- -b . v1.2.1

# Download Ash CLI (+ verify checksum)
curl -sSfL https://github.com/AshAvalanche/ash-rs/releases/download/v0.2.1/ash-macos-arm64-v0.2.1.tar.gz -o ash-macos-arm64-v0.2.1.tar.gz
curl -sSfL https://github.com/AshAvalanche/ash-rs/releases/download/v0.2.1/ash-macos-arm64-v0.2.1.tar.gz.sha512 | sha512sum -c --quiet
tar -xzf ash-macos-arm64-v0.2.1.tar.gz && chmod +x ash
rm ash-macos-arm64-v0.2.1.tar.gz

# Download tokenvm and token-cli (+ verify checksum)
curl -sSfL https://github.com/ava-labs/hypersdk/releases/download/v0.0.7/hypersdk_0.0.7_darwin_arm64.tar.gz -o hypersdk_0.0.7_darwin_arm64.tar.gz
curl -sSfL https://github.com/ava-labs/hypersdk/releases/download/v0.0.7/hypersdk_0.0.7_checksums.txt | sha256sum -c --ignore-missing --quiet
tar -xzf hypersdk_0.0.7_darwin_arm64.tar.gz --wildcards 'token*' && chmod +x token*
rm hypersdk_0.0.7_darwin_arm64.tar.gz

# Create directory for tokenvm profiles
mkdir -p /tmp/tokenvm-e2e-profiles
