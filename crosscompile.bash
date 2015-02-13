#!/bin/bash

# The VERSION is set to the tag for the current commit (if it exists) otherwise
# just the commit id.
VERSION="`git describe --abbrev=0 --tags --exact-match || git rev-parse --short HEAD`"
BUILD_DATE="`date -u +%Y%m%d%.%H%M%S`"
echo "Building flashlight version $VERSION ($BUILD_DATE)"
#gox -ldflags="-w -X main.version $VERSION -X main.buildDate $BUILD_DATE" -osarch="linux/386 linux/amd64 windows/386 darwin/amd64" github.com/getlantern/flashlight
# Linux currently doesn't support cross compilation because of native dependency in systray
gox -ldflags="-w -X main.version $VERSION -X main.buildDate $BUILD_DATE" -osarch="windows/386 darwin/amd64" github.com/getlantern/flashlight
