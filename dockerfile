FROM rocker/r-base:4.5.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    g++ \
    make \
    cmake \
    libssl-dev \
    libcurl4-openssl-dev \
    libuv1-dev\
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
    'pkgload', \
    'fs', \
    'roxygen2', \
    'pak' \
), repos = 'https://cloud.r-project.org/', Ncpus = 4)"

RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash -\
    && apt-get install -y nodejs\
    && node -v \
    && /usr/share/nodejs/corepack/shims/npm -v

WORKDIR /app

COPY ./ /app/

RUN /usr/share/nodejs/corepack/shims/npm i -g taxtract-1.tgz
