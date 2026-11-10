#!/usr/bin/env bash
set -euo pipefail
cp -n .env.example .env || true
echo "Éditer .env puis: docker compose up -d"
