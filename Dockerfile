
FROM r-base:4.0.3

LABEL org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.vendor="Test" \
      org.opencontainers.image.authors="Bartosz Bartmanski"

ENV RENV_VERSION 0.14.0
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

WORKDIR /project

COPY renv.lock renv.lock

RUN R -e "renv::restore()"

