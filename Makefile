
PWD := $(shell pwd)
SHELL := /bin/bash

.PHONY: build
build:
	docker build -t renoirb/salt-multi-repo-helper .

.PHONY: cli
cli:
	docker run -it --rm renoirb/salt-multi-repo-helper sh

.PHONY: salt-versions-report
salt-versions-report:
	docker run -it --rm renoirb/salt-multi-repo-helper --versions-report

.PHONY: pillar
pillar:
	docker run -it --rm renoirb/salt-multi-repo-helper salt-minion pillar.items

.PHONY: grain
grain:
	docker run -it --rm renoirb/salt-multi-repo-helper salt-minion grain.items

.PHONY: projects
projects:
	docker run -it --rm renoirb/salt-multi-repo-helper salt-call projects.names

.PHONY: update
update:
	docker run -it --rm renoirb/salt-multi-repo-helper salt-call state.apply projects.update

.PHONY: fetch
fetch:
	docker run -it --rm renoirb/salt-multi-repo-helper salt-call projects.fetch

