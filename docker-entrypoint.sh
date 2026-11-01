#!/usr/bin/env bash
# Usage:
#   docker run --rm -v "$PWD":/mnt/src ghcr.io/soleo/latex cv.tex
#   docker run --rm -v "$PWD":/mnt/src -e LATEX_ENGINE=xelatex ghcr.io/soleo/latex cv.tex
#   docker run --rm -v "$PWD":/mnt/src ghcr.io/soleo/latex xelatex cv.tex   # run any tool directly
set -euo pipefail
cd /mnt/src

# A command name as the first argument runs that command as-is.
if [ "$#" -gt 0 ] && [[ "$1" != -* ]] && [[ "$1" != *.tex ]] && command -v "$1" >/dev/null 2>&1; then
  exec "$@"
fi

case "${LATEX_ENGINE:-pdflatex}" in
  pdflatex) engine_flag=-pdf ;;
  xelatex)  engine_flag=-xelatex ;;
  lualatex) engine_flag=-lualatex ;;
  *) echo "Unknown LATEX_ENGINE '${LATEX_ENGINE}'. Use pdflatex, xelatex or lualatex." >&2; exit 2 ;;
esac

# latexmk reruns the engine (and biber/bibtex) until references settle.
latexmk "$engine_flag" -interaction=nonstopmode -halt-on-error -file-line-error "$@"
latexmk -c "$@"
