# Docker with LaTeX
[![Docker Container Publisher](https://github.com/soleo/docker-latex/actions/workflows/ci.yml/badge.svg)](https://github.com/soleo/docker-latex/actions/workflows/ci.yml)

LaTeX docker image for compiling LaTeX files, including CVs that need XeLaTeX or LuaLaTeX with system fonts. Package details: https://packages.ubuntu.com/resolute/texlive-full.

## Software versions

* Ubuntu 26.04 LTS
* texlive-full (pdflatex, xelatex, lualatex, latexmk, biber)
* fontconfig, with TeX Live's OpenType/TrueType fonts registered so `fontspec` can load them by name (e.g. Open Sans, Merriweather)
* gnuplot

## Usage

- Get the image

```shell
$ docker pull soleo/latex
```

or

```shell
$ docker build -t soleo/latex .
```

- Compile LaTeX (pdflatex by default; latexmk reruns until references settle, then removes aux files)

```shell
$ docker run --rm -v "$PWD":/mnt/src soleo/latex example.tex
```

- Compile a CV with XeLaTeX or LuaLaTeX

```shell
$ docker run --rm -v "$PWD":/mnt/src -e LATEX_ENGINE=xelatex soleo/latex example-cv.tex
```

- Run any tool directly

```shell
$ docker run --rm -v "$PWD":/mnt/src soleo/latex xelatex cv.tex
$ docker run --rm -v "$PWD":/mnt/src soleo/latex fc-list | grep -i "open sans"
```

- Shortcut function for bash/zsh

```shell
docker-latex() { docker run -v "$PWD":/mnt/src --rm soleo/latex:latest "$@"; }
```

Add the function to your `.bashrc` or `.zshrc`.

## Security note

latexmk runs any `latexmkrc` / `.latexmkrc` in the mounted folder, and that file is Perl code. Only compile projects you trust. The container runs as root and can write anywhere in the mounted folder.

## Feedback

Feel free to fork it or send me a PR to improve it.
