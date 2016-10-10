#!/usr/bin/env bash
cd /mnt/src

exec pdflatex "$@" && \
exec pdflatex "$@" && \
find . -name "*.log" -exec rm -rf {} \; && \
find . -name "*.aux" -exec rm -rf {} \; && \
find . -name "*.out" -exec rm -rf {} \;