
FROM r-base:4.0.3

LABEL org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.vendor="Test" \
      org.opencontainers.image.authors="Bartosz Bartmanski"

ENV RENV_VERSION 0.14.0
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

WORKDIR /scripts/

COPY renv.lock renv.lock
COPY gen_igraph_input.R gen_igraph_input.R
COPY run_carnival.R run_carnival.R
COPY carnival_example.json carnival_example.json
COPY example.sh example.sh

RUN R -e "renv::restore()"

