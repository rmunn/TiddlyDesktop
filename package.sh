#!/bin/bash

# package TiddlyDesktop into zip files

# run this after bld.sh

VERSION=$(./bin/get-version-number)

# Zip them up
if [ "$PLATFORM" = "win" -a "$ARCH" = "ia32" ]; then
pushd ./output/win32
zip -r "../tiddlydesktop-win32-v$VERSION.zip" *
popd
fi
if [ "$PLATFORM" = "win" -a "$ARCH" = "x64" ]; then
pushd ./output/win64
zip -r "../tiddlydesktop-win64-v$VERSION.zip" *
popd
fi
if [ "$PLATFORM" = "osx" -a "$ARCH" = "x64" ]; then
pushd ./output/mac64
zip --symlinks -r "../tiddlydesktop-mac64-v$VERSION.zip" *
popd
fi
if [ "$PLATFORM" = "osx" -a "$ARCH" = "arm64" ]; then
pushd ./output/macapplesilicon
sudo xattr -rc "./TiddlyDesktop-macapplesilicon-v$VERSION/TiddlyDesktop.app" -a sudo codesign --force --deep --sign - "./TiddlyDesktop-macapplesilicon-v$VERSION/TiddlyDesktop.app"
zip --symlinks -r "../tiddlydesktop-macapplesilicon-v$VERSION.zip" *
popd
fi
if [ "$PLATFORM" = "linux" -a "$ARCH" = "ia32" ]; then
pushd ./output/linux32
zip -r "../tiddlydesktop-linux32-v$VERSION.zip" *
popd
fi
if [ "$PLATFORM" = "linux" -a "$ARCH" = "x64" ]; then
pushd ./output/linux64
zip -r "../tiddlydesktop-linux64-v$VERSION.zip" *
popd
fi
