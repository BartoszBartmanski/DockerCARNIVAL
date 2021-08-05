
build:
	docker build -f Dockerfile .

run_example:
	mkdir -p Output
	docker run -it --rm -v $$(pwd)/Scripts/:/project/Scripts/ -v /opt/:/opt/ -v $$(pwd)/Output/:/project/Output/ c7edd3b1518f /project/Scripts/example_cplex.R

clean:
	rm -rf Output/
