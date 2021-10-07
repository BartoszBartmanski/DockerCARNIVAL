
FROM r-base:4.0.3

LABEL org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.vendor="Test" \
      org.opencontainers.image.authors="Bartosz Bartmanski"

WORKDIR /example/

COPY gen_igraph_input.R gen_igraph_input.R
COPY run_carnival.R run_carnival.R
COPY other_solvers.R other_solvers.R
COPY lp_solve.json lp_solve.json
COPY run_example.sh run_example.sh

RUN apt -y update
RUN apt -y install libhdf5-dev graphviz git
RUN R -e "install.packages(c('remotes', 'BiocManager', 'igraph', 'stringi'), repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "BiocManager::install('rhdf5')"
RUN R -e "remotes::install_github('saezlab/CARNIVAL', ref='963fbc1db2d038bfeab76abe792416908327c176')"

