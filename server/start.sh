#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if [[ ! -x ./tfs ]]; then
  echo "Could not find the Linux binary ./tfs" >&2
  exit 1
fi

echo "Starting Open Tibia server (The Forgotten Server 1.6, protocol 13.10)..."
echo "Make sure MariaDB/MySQL is running and schema.sql has been imported."
exec ./tfs
