# Docker with LaTeX
[![Docker Container Publisher](https://github.com/soleo/docker-latex/actions/workflows/ci.yml/badge.svg)](https://github.com/soleo/docker-latex/actions/workflows/ci.yml)

LaTeX docker image for compiling LaTeX files, including CVs that need XeLaTeX or LuaLaTeX with system fonts. Package details: https://packages.ubuntu.com/resolute/texlive-full.

## Software versions

* Ubuntu 26.04 LTS
* texlive-full (pdflatex, xelatex, lualatex, latexmk, biber)
* fontconfig, with TeX Live's OpenType/TrueType fonts registered so `fontspec` can load them by name (e.g. Open Sans, Merriweather)
* gnuplot

## Setup

You need a Docker engine. On macOS, [Rancher Desktop](https://rancherdesktop.io/) works well and is free.

1. Install it:

   ```shell
   $ brew install --cask rancher
   ```

2. Start it with the Docker engine (moby) and Kubernetes off. Either pick those options on first launch, or run:

   ```shell
   $ "/Applications/Rancher Desktop.app/Contents/Resources/resources/darwin/bin/rdctl" start \
       --container-engine.name=moby \
       --kubernetes.enabled=false \
       --application.path-management-strategy=manual
   ```

3. Put its tools on your `PATH` (add this to `~/.zshrc` to keep it):

   ```shell
   $ export PATH="$HOME/.rd/bin:$PATH"
   ```

4. Check it works:

   ```shell
   $ docker version
   $ docker context ls   # rancher-desktop should be marked with *
   ```

On Linux, any Docker Engine install works.

## Usage

- Get the image

```shell
$ docker pull ghcr.io/soleo/latex
```

The image is published to the GitHub Container Registry from `master`. The old `soleo/latex` image on Docker Hub is from 2020 and no longer updated.

or

```shell
$ docker build -t ghcr.io/soleo/latex .
```

- Compile LaTeX (pdflatex by default; latexmk reruns until references settle, then removes aux files)

```shell
$ docker run --rm -v "$PWD":/mnt/src ghcr.io/soleo/latex example.tex
```

- Compile a CV with XeLaTeX or LuaLaTeX

```shell
$ docker run --rm -v "$PWD":/mnt/src -e LATEX_ENGINE=xelatex ghcr.io/soleo/latex example-cv.tex
```

- Run any tool directly

```shell
$ docker run --rm -v "$PWD":/mnt/src ghcr.io/soleo/latex xelatex cv.tex
$ docker run --rm -v "$PWD":/mnt/src ghcr.io/soleo/latex fc-list | grep -i "open sans"
```

- Shortcut function for bash/zsh

```shell
docker-latex() { docker run -v "$PWD":/mnt/src --rm ghcr.io/soleo/latex:latest "$@"; }
```

Add the function to your `.bashrc` or `.zshrc`.

## Security note

latexmk runs any `latexmkrc` / `.latexmkrc` in the mounted folder, and that file is Perl code. Only compile projects you trust. The container runs as root and can write anywhere in the mounted folder.

## Feedback

Feel free to fork it or send me a PR to improve it.
