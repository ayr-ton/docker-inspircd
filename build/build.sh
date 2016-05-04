#!/bin/sh

INSPIRCD_VERSION=2.0.21
URL="https://github.com/inspircd/inspircd/archive/v${INSPIRCD_VERSION}.tar.gz"

cd "$( dirname "$0" )"

# Build build environment
echo "Building inspircd-build image."
docker build -t "inspircd-build" .

# Get source
if [ ! -d "inspircd-${INSPIRCD_VERSION}" ]; then
    echo "Downloading InspIRCd"
    wget $URL
    tar xzf "v${INSPIRCD_VERSION}.tar.gz"
fi

rm -rf ../inspircd && mkdir ../inspircd

# Start build environment
echo "Starting build..."
docker run \
    -v $(pwd)/inspircd-${INSPIRCD_VERSION}:/inspircd-build \
    -v $(pwd)/../inspircd:/inspircd \
    inspircd-build \
    /build-inner.sh

echo "\n***********************************************************************"
echo "Build Complete!"
echo "You may now build the inspircd image moving to the root of the"
echo "repository and runng  and running:\n"
echo "  docker build -t inspircd .\n"
