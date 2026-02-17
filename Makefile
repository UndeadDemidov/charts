# Helm Chart Repository Makefile

# Repository URL (GitHub Pages)
REPO_URL ?= https://UndeadDemidov.github.io/charts

# Default target
.DEFAULT_GOAL := help

.PHONY: help index clean package verify

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

index: ## Update the Helm repository index.yaml file
	@echo "Updating Helm repository index..."
	helm repo index . --url $(REPO_URL)
	@echo "Index updated successfully!"

clean: ## Remove all .tgz chart packages
	@echo "Removing chart packages..."
	rm -f *.tgz
	@echo "Cleanup complete!"

package: ## Package all charts in the current directory (if Chart.yaml exists)
	@echo "Packaging charts..."
	@if [ -f Chart.yaml ]; then \
		helm package .; \
	else \
		echo "No Chart.yaml found in current directory. Skipping packaging."; \
	fi

verify: ## Verify the index.yaml file
	@echo "Verifying index.yaml..."
	@helm repo index . --merge index.yaml --url $(REPO_URL) --debug || true
	@echo "Verification complete!"
