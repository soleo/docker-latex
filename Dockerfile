FROM blang/latex
MAINTAINER Xinjiang Shao <shaoxinjiang at gmail dot com>

ADD build /usr/bin/build
RUN chmod +x /usr/bin/build

ADD clean /usr/bin/clean
RUN chmod +x /usr/bin/clean

VOLUME /latex
WORKDIR /latex
