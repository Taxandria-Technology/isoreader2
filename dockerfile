FROM rocker/r-base:4.5.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    g++ \
    make \
    cmake \
    libssl-dev \
    libcurl4-openssl-dev \
    libx11-dev\
    libxml2-dev \
    libsimdjson-dev \
    pandoc \
    git \
    curl \
    ca-certificates \
    xclip \
    && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c( \
    'ggplot2', \
    'dplyr', \
    'tidyr', \
    'tidyselect', \
    'purrr', \
    'rlang', \
    'cli', \
    'lifecycle', \
    'processx', \
    'readr', \
    'tibble', \
    'withr', \
    'RcppSimdJson', \
    'scales', \
    'fansi', \
    'knitr', \
    'pkgbuild', \
    'pak' \
), repos = 'https://cloud.r-project.org/', Ncpus = 4)"

WORKDIR /app

COPY ./ /app/
