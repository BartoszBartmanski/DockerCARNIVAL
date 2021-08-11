#!/usr/bin/env bash

DATA_DIR=${1:-"/output/"}

/scripts/gen_igraph_input.R 10 8 3 3 Erdos ${DATA_DIR}/example_input.h5
/scripts/run_carnival.R ${DATA_DIR}/example_input.h5 ${DATA_DIR}/example_result.Rds /scripts/carnival_example.json

