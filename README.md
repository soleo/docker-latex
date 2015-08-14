# latex
a docker repo for latex 

## Usage

Build
`` docker pull soleo/latex `` or `` docker build soleo/latex . ``

Compile 
``docker run --rm -v `pwd`:/latex soleo/latex build example.tex``

Clean the log, aux, etc files
``docker run --rm -v `pwd`:/latex soleo/latex clean``