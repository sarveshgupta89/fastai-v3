#!/usr/bin/env sh
# Run the app from the project root so paths resolve correctly.
cd "$(dirname "$0")"
exec python app/server.py serve
