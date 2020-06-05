#!/bin/sh
set -e

chown -R coder:coder /home/coder/project

/usr/bin/code-server --install-extension bmewburn.vscode-intelephense-client --force

dumb-init fixuid -q /usr/bin/code-server --bind-addr 0.0.0.0:${PORT} .
