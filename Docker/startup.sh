#!/bin/sh
set -e

chown -R coder:coder /home/coder/project
dumb-init code-server --allow-http --no-auth
