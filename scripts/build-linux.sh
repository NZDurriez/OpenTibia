#!/usr/bin/env bash
# Rebuild the Linux x86_64 TFS binary from vendor/forgottenserver-1.6
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/vendor/forgottenserver-1.6"
BUILD="$SRC/build"

if [[ ! -f "$SRC/CMakeLists.txt" ]]; then
  echo "Missing TFS sources at $SRC" >&2
  exit 1
fi

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  cmake ninja-build g++ pkg-config \
  liblua5.3-dev libmysqlclient-dev \
  libboost-system-dev libboost-iostreams-dev libboost-locale-dev libboost-json-dev \
  libpugixml-dev libfmt-dev libssl-dev

rm -rf "$BUILD"
mkdir -p "$BUILD"
cd "$BUILD"
CC=gcc CXX=g++ cmake -DCMAKE_BUILD_TYPE=Release -DUSE_LUAJIT=OFF -DENABLE_UNITY_BUILD=ON -DSKIP_GIT=ON -G Ninja ..
cmake --build . --parallel "$(nproc)"
install -m 0755 "$BUILD/tfs" "$ROOT/server/tfs"
echo "Installed $ROOT/server/tfs"
