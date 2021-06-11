.PHONY: run

mkfile_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

run:
	mkdir -p $(mkfile_dir)vendorA/data
	cp -r $(mkfile_dir)../shared/irma $(mkfile_dir)vendorA/data/

	mkdir -p $(mkfile_dir)vendorB/data
	cp -r $(mkfile_dir)../shared/irma $(mkfile_dir)vendorB/data/

	cd $(mkfile_dir) && docker-compose pull
	cd $(mkfile_dir) && docker-compose up --remove-orphans

reset:
	rm -rf $(mkfile_dir)vendorA/data/*
	echo "{}" > $(mkfile_dir)vendorA/data/customers.json

	rm -rf $(mkfile_dir)vendorB/data/*
	echo "{}" > $(mkfile_dir)vendorB/data/customers.json