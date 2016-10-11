# Docker with LaTeX
[![Build Status](https://travis-ci.org/soleo/docker-latex.svg?branch=master)](https://travis-ci.org/soleo/docker-latex)

LaTeX docker image for compiling latex files. Details of the package can be found on http://packages.ubuntu.com/xenial/texlive-full.

## software verisons

* Ubuntu:16.04
* textlive-full(2015.20160320-1)
* gnuplot

## Usage

- Build image

```shell
$ docker pull soleo/latex
``` 

or 

```shell
$ docker build soleo/latex . 
```

- Compile LaTeX

```shell
$ docker run --rm -v `pwd`:/mnt/src soleo/latex example.tex 
```

- Shortcut function for bash

```shell
docker-latex() { docker run -v $PWD:/mnt/src --rm  soleo/latex:latest $@; return $?; }
```

add the function to your .bash_rc or .bash_profile

## Feedback

Feel free to fork it or send me PR to improve it.