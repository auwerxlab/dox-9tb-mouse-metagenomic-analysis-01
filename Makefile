.PHONY: help render commit
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

NOTEBOOKS = $(wildcard notebooks/*.Rmd)

help:
	@python3 -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

render: ## render all R notebooks located in notebooks/
	@for fp in $(wildcard notebooks/*.Rmd); do \
	Rscript -e "rmarkdown::render('$$fp')" ; \
	done

commit: ## run git commit with --no-verify option
	git add -A \
	&& git commit -m "make commit" --no-verify