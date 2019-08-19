.PHONY: build run

REPO  ?= szc10/xmake
TAG   ?= latest
IMAGE ?= szc10/vscode
HTTP_PASSWORD ?= 123456
CUSTOM_USER ?= ubuntu
PASSWORD ?= ubuntu

build:
	docker build -t $(REPO):$(TAG) --build-arg image=$(IMAGE) .
run:
	docker run --rm \
		-p 6080:80 \
		-e USER=$(CUSTOM_USER) \
		-e PASSWORD=$(PASSWORD) \
		--name ubuntu-desktop-lxde-test \
		$(REPO):$(TAG)

shell:
	docker exec -it ubuntu-desktop-lxde-test bash

gen-ssl:
	mkdir -p ssl
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout ssl/nginx.key -out ssl/nginx.crt
