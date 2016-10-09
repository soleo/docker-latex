#!/usr/bin/env bash
cd /mnt/src
exec pdflatex "$@" && pdflatex "$@" && rm -rf *.log && rm -rf *.aux && rm -rf *.out