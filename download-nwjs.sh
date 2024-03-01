#!/bin/bash

# Create dir if not existent

[[ -d ./nwjs ]] || mkdir ./nwjs || exit 1

# Set default nw.js version if not specified in environment variable or parameter

if [ $# -gt 0 ]; then
    NWJS_VERSION=$1
elif [ -z "$NWJS_VERSION" ]; then
    NWJS_VERSION=0.77.0
fi

# Download nw.js

curl --output "nwjs/nwjs-sdk-v${NWJS_VERSION}-win-x64.zip" "https://dl.nwjs.io/v${NWJS_VERSION}/nwjs-sdk-v${NWJS_VERSION}-win-x64.zip" || exit 1
curl --output "nwjs/nwjs-sdk-v${NWJS_VERSION}-win-ia32.zip" "https://dl.nwjs.io/v${NWJS_VERSION}/nwjs-sdk-v${NWJS_VERSION}-win-ia32.zip" || exit 1
curl --output "nwjs/nwjs-sdk-v${NWJS_VERSION}-linux-x64.tar.gz" "https://dl.nwjs.io/v${NWJS_VERSION}/nwjs-sdk-v${NWJS_VERSION}-linux-x64.tar.gz" || exit 1
curl --output "nwjs/nwjs-sdk-v${NWJS_VERSION}-linux-ia32.tar.gz" "https://dl.nwjs.io/v${NWJS_VERSION}/nwjs-sdk-v${NWJS_VERSION}-linux-ia32.tar.gz" || exit 1
curl --output "nwjs/nwjs-sdk-v${NWJS_VERSION}-osx-x64.zip" "https://dl.nwjs.io/v${NWJS_VERSION}/nwjs-sdk-v${NWJS_VERSION}-osx-x64.zip" || exit 1
curl --output "nwjs/nwjs-sdk-v${NWJS_VERSION}-osx-arm64.zip" "https://dl.nwjs.io/v${NWJS_VERSION}/nwjs-sdk-v${NWJS_VERSION}-osx-arm64.zip" || exit 1

pushd nwjs

ls *.gz | xargs -n 1 tar -xvzf || exit 1
ls *.zip | xargs -n 1 unzip || exit 1

popd
