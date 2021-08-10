#!/usr/bin/env Rscript

library(CARNIVAL)

args <- commandArgs(trailingOnly=TRUE)

load(file = system.file("toy_inputs_ex1.RData", package="CARNIVAL"))
load(file = system.file("toy_measurements_ex1.RData", package="CARNIVAL"))
load(file = system.file("toy_network_ex1.RData", package="CARNIVAL"))

# lpSolve
# path_to_cplex <- system("which cplex", intern=TRUE)
path_to_cplex <- "/opt/ibm/ILOG/CPLEX_Studio201/cplex/bin/x86-64_linux/cplex"
output_dir <- args[1]

print(path_to_cplex)
dir.create(output_dir, showWarnings=F)

result = runCARNIVAL(solver = "cplex",
                     solverPath = path_to_cplex,
                     inputObj = toy_inputs_ex1,
                     measObj = toy_measurements_ex1,
                     netObj = toy_network_ex1,
                     dir_name=output_dir)
print(result)

saveRDS(result, paste0(output_dir, "/example_result.Rds"))
