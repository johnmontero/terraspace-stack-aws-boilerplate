.DEFAULT_GOAL := help

## INCLUDE ##
include makefiles/ct.mk
include makefiles/ts.mk

## GENERAL ##
OWNER          = __OWNER__
TYPE_APP       = stack
SERVICE_NAME   = __SERVICE_NAME__

## DEPLOY ##
ENV           ?= dev
AWS_REGION    ?= us-west-2
AWS_PROFILE   ?= default
STACK_DIR      = ts
PROJECT_NAME   = $(OWNER)-$(TYPE_APP)-$(SERVICE_NAME)
IMAGE          = $(PROJECT_NAME):latest

## HELP ##
help:
	@printf "\033[31m%-16s %-39s %s\033[0m\n" "Target" "Help" "Usage"; \
	printf "\033[31m%-16s %-39s %s\033[0m\n" "------" "----" "-----"; \
	grep -hE '^\S+:.*## .*$$' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' | sort | awk 'BEGIN {FS = ":"}; {printf "\033[32m%-16s\033[0m %-38s \033[34m%s\033[0m\n", $$1, $$2, $$3}'

