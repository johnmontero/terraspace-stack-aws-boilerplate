.PHONY: ct.copy_gemfile \
		ct.build.image \
		ct.cmd \
		ct.shell

# Container
ct.copy_gemfile:
	@cp $(STACK_DIR)/Gemfile docker/resources/Gemfile && \
		cp $(STACK_DIR)/Gemfile.lock docker/resources/Gemfile.lock

ct.build.image: ct.copy_gemfile ## Build image for development.: make ct.build.image
	@docker build -f docker/Dockerfile -t $(IMAGE) ./docker --no-cache
	@rm docker/resources/Gemfile && \
		rm docker/resources/Gemfile.lock

ct.cmd:
	@docker run --rm -it \
		--name $(PROJECT_NAME) \
		-v $(PWD)/$(STACK_DIR):/$(STACK_DIR) \
		-v ~/.aws/config:/root/.aws/config \
		-v ~/.aws/credentials:/root/.aws/credentials \
		-w /$(STACK_DIR) \
		-e AWS_REGION=${AWS_REGION} \
		-e AWS_PROFILE=${AWS_PROFILE} \
		-e OWNER=${OWNER} \
		-e TS_ENV=${ENV} \
		$(IMAGE) \
		$(COMMAND)

ct.shell: ## Connect to the container by shell.: make ct.shell
	@make --no-print-directory ct.cmd COMMAND="sh"