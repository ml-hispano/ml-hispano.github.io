SNAME ?= mkdocs-diy
NAME ?= elswork/$(SNAME)
VER ?= `cat VERSION`
BASE ?= alpine
BASENAME ?= python:$(BASE)
RUTA ?= $(CURDIR)
SITE ?= 
TO ?= /src
ARCH2 ?= armv7l
ARCH3 ?= aarch64
GOARCH := $(shell uname -m)
ifeq ($(GOARCH),x86_64)
	GOARCH := amd64
endif

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
# Build the container

debug: ## Build the container
	docker build -t $(NAME):$(GOARCH) \
	--build-arg BASEIMAGE=$(BASENAME) \
	--build-arg VERSION=$(SNAME)_$(GOARCH)_$(VER) .
build: ## Build the container
	docker build --no-cache -t $(NAME):$(GOARCH) --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	--build-arg VCS_REF=`git rev-parse --short HEAD` \
	--build-arg BASEIMAGE=$(BASENAME) \
	--build-arg VERSION=$(SNAME)_$(GOARCH)_$(VER) . > ../builds/$(SNAME)_$(GOARCH)_$(VER)_`date +"%Y%m%d_%H%M%S"`.txt
tag: ## Tag the container
	docker tag $(NAME):$(GOARCH) $(NAME):$(GOARCH)_$(VER)
push: ## Push the container
	docker push $(NAME):$(GOARCH)_$(VER)
	docker push $(NAME):$(GOARCH)	
deploy: build tag push
manifest: ## Create an push manifest
	docker manifest create $(NAME):$(VER) \
	$(NAME):$(GOARCH)_$(VER) \
	$(NAME):$(ARCH2)_$(VER) \
	$(NAME):$(ARCH3)_$(VER)
	docker manifest push --purge $(NAME):$(VER)
	docker manifest create $(NAME):latest $(NAME):$(GOARCH) \
	$(NAME):$(ARCH2) \
	$(NAME):$(ARCH3)
	docker manifest push --purge $(NAME):latest
serve: ## Preview and live modify with auto-reloading $(RUTA)/$(SITE)
	docker run -it --rm -v $(RUTA)/$(SITE):/mkdocs -p 7777:7777 $(NAME):$(GOARCH) mkdocs serve -a 0.0.0.0:7777
mkbuild: ## Generate website static files
	docker run -it --rm -v $(RUTA)/$(SITE):/mkdocs -p 7777:7777 $(NAME):$(GOARCH) mkdocs build
mkhelp: ## MkDocs commands help
	docker run -it --rm -v $(RUTA)/$(SITE):/mkdocs -p 7777:7777 $(NAME):$(GOARCH) mkdocs -h
helpserve: ## MkDocs serve command help
	docker run -it --rm -v $(RUTA)/$(SITE):/mkdocs -p 7777:7777 $(NAME):$(GOARCH) mkdocs serve -h
version: ## Display MkDocs version
	docker run -it --rm -v $(RUTA)/$(SITE):/mkdocs -p 7777:7777 $(NAME):$(GOARCH) mkdocs -V