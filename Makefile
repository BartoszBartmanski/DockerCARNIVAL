
VERSIONS := $(patsubst %/Dockerfile,%,$(wildcard */Dockerfile))

all: $(addprefix build_,${VERSIONS})

all_examples: Output/LPsolve/example_result.Rds Output/CPLEX/example_result.Rds

.PHONY: build_%
build_%:
	cd $* && docker build -t carnival:$* -f Dockerfile .

Output/LPsolve/example_result.Rds:
	mkdir -p $(dir $@) && docker run -it --rm -v $$(pwd)/$(dir $@):/output/ carnival:2.2.0 /scripts/example.sh /output/

.PHONY: clean_images
clean_images:
	docker images -a | grep "carnival" | awk '{print $$3}' | xargs docker rmi

.PHONY: clean
clean:
	rm -rf Output/

