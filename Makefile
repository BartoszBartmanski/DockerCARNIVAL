
all: build_latest

all_examples: Output/LPsolve/example_result.Rds Output/CPLEX/example_result.Rds

.PHONY: build
build_%:
	docker build -t bartoszbartmanski/carnival:$* -f Dockerfile .

Output/LPsolve/example_result.Rds:
	mkdir -p $(dir $@) && docker run -it --rm -v $$(pwd)/$(dir $@):/output/ bartoszbartmanski/carnival:latest /scripts/example.sh /output/

Output/CPLEX/example_result.Rds:
	mkdir -p $(dir $@) && docker run -it --rm -v $$(pwd):/output/ -v /opt/:/opt/ bartoszbartmanski/carnival:latest /output/Scripts/example_cplex.R /output/$(dir $@)

.PHONY: push_%
push_%: build_%
	docker push bartoszbartmanski/carnival:$*

.PHONY: clean_images
clean_images:
	docker images -a | grep "carnival" | awk '{print $$3}' | xargs docker rmi

.PHONY: clean
clean:
	rm -rf Output/

