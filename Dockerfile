FROM ubuntu:26.04
LABEL maintainer="Xinjiang Shao <shaoxinjiang at gmail dot com>"

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# texlive-full brings pdflatex, xelatex, lualatex, latexmk, biber and the
# font packages CV templates use (Open Sans, Merriweather, Font Awesome, ...).
RUN apt-get update -q && \
    apt-get install -y --no-install-recommends \
        texlive-full \
        fontconfig \
        gnuplot && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Let XeLaTeX/LuaLaTeX (fontspec) find TeX Live's fonts by family name.
COPY texlive-fonts.conf /etc/fonts/conf.d/09-texlive-fonts.conf
RUN fc-cache -f

VOLUME /mnt/src
WORKDIR /mnt/src

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
