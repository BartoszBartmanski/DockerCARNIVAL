
build:
	docker build -t carnival:2.2.0 -f Dockerfile .

run_example:
	mkdir -p Output
	docker run -it --rm -v $$(pwd)/Scripts/:/project/Scripts/ -v /opt/:/opt/ -v $$(pwd)/Output/:/project/Output/ carnival:2.2.0 /project/Scripts/example_cplex.R

clean:
	rm -rf Output/
