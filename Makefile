
cplex_path := $(dir $(shell which cplex))

all: build_latest

all_examples: Output/LPsolve/example_result.Rds Output/CPLEX/example_result.Rds

.PHONY: build
build_%:
	docker build -t bartoszbartmanski/carnival:$* -f Dockerfile .

example_result.Rds:
	docker run -it -v `pwd`:/data/ --rm bartoszbartmanski/carnival:latest /example/run_example.sh /data/

cplex_example.Rds:
	docker run -it --rm -v `pwd`:/data/ -v ${cplex_path}:${cplex_path} bartoszbartmanski/carnival:latest /example/other_solvers.R cplex ${cplex_path}/cplex /data/$@

.PHONY: push_%
push_%: build_%
	docker push bartoszbartmanski/carnival:$*

.PHONY: clean_images
clean_images:
	docker images -a | grep "carnival" | awk '{print $$3}' | xargs docker rmi

clean:
	rm -f *.RData *.lp *.h5 *.dot *.Rds *.txt *.sol *.log

