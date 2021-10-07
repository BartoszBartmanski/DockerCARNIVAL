#!/usr/bin/env bash

OUTPUT_DIR=${1:-/example}

/example/gen_igraph_input.R 10 8 3 3 Erdos ${OUTPUT_DIR}/example_input.h5
/example/run_carnival.R ${OUTPUT_DIR}/example_input.h5 ${OUTPUT_DIR}/example_result.Rds /example/lp_solve.json

