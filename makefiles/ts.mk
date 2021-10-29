.PHONY: ts.env.show \
		ts.cmd

ts.env.show:
	@echo "------------------------ Environment  Variables ------------------------" && \
		echo "AWS_PROFILE: ${AWS_PROFILE}" && \
		echo "AWS_REGION : ${AWS_REGION}" && \
		echo "ENV        : ${ENV}" && \
		echo "OWNER      : ${OWNER}" && \
		echo "------------------------------------------------------------------------"

ts.cmd: ts.env.show ## Execute terraspace command.: make ts.cmd
	@make --no-print-directory ct.cmd COMMAND="bundle exec ${COMMAND}"