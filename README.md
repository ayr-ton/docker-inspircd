Docker InspIRCd
===============

These Dockerfiles build a container housing InspIRCd. The current version
is 2.0.18.

This repository is split into two Dockerfiles. The first, in the build/
directory, builds the image for the build environment. That image is
tagged inspircd-build and pulls in build-essentials.

The second Dockerfile is in the root of the repository. It uses the
InspIRCd binary built in the build environment to create an image without
build-essentials.

To use this image you will need to populate the /inspircd/conf directory
with configuration files. There are two ways to do this:

1. Bind a conf/ directory from the host machine

    docker run -v /my/conf:/inspircd/conf -p 6667 insomniairc/inspircd

2. Create your own image using insomniairc/inspircd as a base. For an
   example, see [insomniairc/insomniaircd][insomniaircd]

[insomniaircd]: https://github.com/insomniairc/insomniaircd


Building
--------

Follow the steps below to build the image with the latest InspIRCd.

1. Update build/build.sh to download the latest version.
2. Run `./build/build.sh`
3. Run `docker build -t inspircd .`

The build script will download and compile the latest InspIRCd in the
build environment.
