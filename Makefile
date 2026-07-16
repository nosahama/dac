CONTAINER_NAME = dac
IMAGE_NAME := $(CONTAINER_NAME)
DAC_VERSION := $(strip $(shell [ -f VERSION ] && cat VERSION || echo 0.1.1))

JAVA_JARS_LOCATION := /jars
DIAGRAMS_CONTAINER_LOCATION := /diagrams
OUTPUT_CONTAINER_LOCATION := /output
DIAGRAMS_HOST_LOCATION ?= $(PWD)/diagrams
OUTPUT_HOST_LOCATION ?= $(PWD)/output

PREFIX ?= $(HOME)/.local
BINDIR ?= $(PREFIX)/bin
BASH_COMPLETION_DIR ?= $(PREFIX)/share/bash-completion/completions
ZSH_COMPLETION_DIR ?= $(PREFIX)/share/zsh/site-functions

PY_DAC_CONTAINER_LOCATION := $(DIAGRAMS_CONTAINER_LOCATION)/py
UML_DAC_CONTAINER_LOCATION := $(DIAGRAMS_CONTAINER_LOCATION)/uml
MERMAID_DAC_CONTAINER_LOCATION := $(DIAGRAMS_CONTAINER_LOCATION)/mermaid
DOT_DAC_CONTAINER_LOCATION := $(DIAGRAMS_CONTAINER_LOCATION)/dot
D2_DAC_CONTAINER_LOCATION := $(DIAGRAMS_CONTAINER_LOCATION)/d2

# Other config
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m


### --------------------------------------------------------------------------------------------------------------------
### RULES
### (https://www.gnu.org/software/make/manual/html_node/Rule-Introduction.html)
### --------------------------------------------------------------------------------------------------------------------

.PHONY: help setup clean run-container stop-container test \
	generate-py generate-puml generate-mermaid generate-dot generate-d2 \
	diagrams-py diagrams-uml diagrams-mermaid diagrams-dot diagrams-d2 \
	dac-py dac-uml dac-mermaid dac-dot dac-d2 \
	render render-all sync-doc-examples refresh-docs list doctor version install install-script install-completion \
	docs-build docs-serve

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  run-container        build the docker image and start the renderer container"
	@echo "  stop-container       stop and remove the renderer container"
	@echo "  doctor               check local and container toolchain prerequisites"
	@echo "  list                 print all bundled examples and output locations"
	@echo "  render               shorthand for any engine: make render engine=py filename=easy"
	@echo "  generate-py          render a Python diagrams file: filename=<name> inputext=py"
	@echo "  generate-puml        render a PlantUML file: filename=<name> inputext=puml"
	@echo "  generate-mermaid     render a Mermaid file: filename=<name> inputext=mmd"
	@echo "  generate-dot         render a Graphviz DOT file: filename=<name> inputext=dot"
	@echo "  generate-d2          render a D2 file: filename=<name> inputext=d2"
	@echo "  render-all           render every sample example into \$$OUTPUT_HOST_LOCATION (default: ./output)"
	@echo "  sync-doc-examples    copy rendered PNGs into docs/assets/examples for the site gallery"
	@echo "  refresh-docs         render all examples, then sync site gallery assets"
	@echo "  docs-build           build docs with Jekyll (theme + page conversion) using docs/_config.yml"
	@echo "  docs-serve           run Jekyll preview server at http://localhost:\$${DOCS_PORT:-4000}/"
	@echo "  test                 render and verify every supported diagram type"
	@echo "  version              print dac version"
	@echo "  install              install dac into \$$BINDIR"
	@echo "  install-completion   install shell completions"
	@echo ""
	@echo "Options"
	@echo "  DIAGRAMS_HOST_LOCATION  source root for diagrams (default: $(PWD)/diagrams)"
	@echo "  OUTPUT_HOST_LOCATION    output root for generated images (default: $(PWD)/output)"

setup:
	docker build -t $(CONTAINER_NAME) .

clean: stop-container

doctor:
	@set -e; \
	command -v docker >/dev/null; \
	command -v make >/dev/null; \
	command -v curl >/dev/null; \
	docker info >/dev/null; \
	docker build -t $(CONTAINER_NAME) . >/dev/null; \
	docker run --rm --entrypoint sh $(CONTAINER_NAME) -lc '\
		command -v python3 >/dev/null && \
		command -v java >/dev/null && \
		command -v d2 >/dev/null && \
		command -v dot >/dev/null && \
		python3 --version && \
		java -version >/dev/null 2>&1 && \
		d2 --version && \
		dot -V >/dev/null 2>&1'

run-container: setup
	@if [ ! -d "$(DIAGRAMS_HOST_LOCATION)" ]; then \
		echo "DIAGRAMS_HOST_LOCATION not found: $(DIAGRAMS_HOST_LOCATION)" >&2; \
		exit 1; \
	fi
	@mkdir -p "$(OUTPUT_HOST_LOCATION)"
	@docker rm -f $(CONTAINER_NAME) >/dev/null 2>&1 || true
	docker run -d \
		-v "$(DIAGRAMS_HOST_LOCATION):$(DIAGRAMS_CONTAINER_LOCATION)" \
		-v "$(OUTPUT_HOST_LOCATION):$(OUTPUT_CONTAINER_LOCATION)" \
		--name $(CONTAINER_NAME) $(IMAGE_NAME)

stop-container:
	@docker rm -f $(CONTAINER_NAME) >/dev/null 2>&1 || true

generate-py:
	@printf "$(OK_COLOR)==> Running DaC Python $(NO_COLOR)\n"
	docker exec -t $(CONTAINER_NAME) sh /scripts/render_one.sh py $(filename) $(inputext)

generate-puml:
	@printf "$(OK_COLOR)==> Running DaC PlantUML $(NO_COLOR)\n"
	docker exec -t $(CONTAINER_NAME) sh /scripts/render_one.sh puml $(filename) $(inputext)

generate-mermaid:
	@printf "$(OK_COLOR)==> Running DaC Mermaid $(NO_COLOR)\n"
	docker exec -t $(CONTAINER_NAME) sh /scripts/render_one.sh mermaid $(filename) $(inputext)

generate-dot:
	@printf "$(OK_COLOR)==> Running DaC Graphviz $(NO_COLOR)\n"
	docker exec -t $(CONTAINER_NAME) sh /scripts/render_one.sh dot $(filename) $(inputext)

generate-d2:
	@printf "$(OK_COLOR)==> Running DaC D2 $(NO_COLOR)\n"
	docker exec -t $(CONTAINER_NAME) sh /scripts/render_one.sh d2 $(filename) $(inputext)

render:
	@set -e; \
	if [ -z "$(engine)" ] || [ -z "$(filename)" ]; then \
		echo "usage: make render engine=<py|puml|mermaid|dot|d2> filename=<name> [inputext=<ext>]" >&2; \
		exit 2; \
	fi; \
	$(MAKE) run-container DIAGRAMS_HOST_LOCATION="$(DIAGRAMS_HOST_LOCATION)" OUTPUT_HOST_LOCATION="$(OUTPUT_HOST_LOCATION)" >/dev/null; \
	case "$(engine)" in \
		py) ext="$${inputext:-py}"; $(MAKE) generate-py filename=$(filename) inputext="$$ext" DIAGRAMS_HOST_LOCATION="$(DIAGRAMS_HOST_LOCATION)" OUTPUT_HOST_LOCATION="$(OUTPUT_HOST_LOCATION)";; \
		puml|uml) ext="$${inputext:-puml}"; $(MAKE) generate-puml filename=$(filename) inputext="$$ext" DIAGRAMS_HOST_LOCATION="$(DIAGRAMS_HOST_LOCATION)" OUTPUT_HOST_LOCATION="$(OUTPUT_HOST_LOCATION)";; \
		mermaid) ext="$${inputext:-mmd}"; $(MAKE) generate-mermaid filename=$(filename) inputext="$$ext" DIAGRAMS_HOST_LOCATION="$(DIAGRAMS_HOST_LOCATION)" OUTPUT_HOST_LOCATION="$(OUTPUT_HOST_LOCATION)";; \
		dot) ext="$${inputext:-dot}"; $(MAKE) generate-dot filename=$(filename) inputext="$$ext" DIAGRAMS_HOST_LOCATION="$(DIAGRAMS_HOST_LOCATION)" OUTPUT_HOST_LOCATION="$(OUTPUT_HOST_LOCATION)";; \
		d2) ext="$${inputext:-d2}"; $(MAKE) generate-d2 filename=$(filename) inputext="$$ext" DIAGRAMS_HOST_LOCATION="$(DIAGRAMS_HOST_LOCATION)" OUTPUT_HOST_LOCATION="$(OUTPUT_HOST_LOCATION)";; \
		*) echo "unknown engine: $(engine)" >&2; exit 2 ;; \
	esac

diagrams-py: generate-py
diagrams-uml: generate-puml
diagrams-mermaid: generate-mermaid
diagrams-dot: generate-dot
diagrams-d2: generate-d2

dac-py: generate-py
dac-uml: generate-puml
dac-mermaid: generate-mermaid
dac-dot: generate-dot
dac-d2: generate-d2

render-all: run-container
	docker exec -t $(CONTAINER_NAME) sh /scripts/render_examples.sh

DOC_EXAMPLE_ENGINES := py uml mermaid dot d2
DOC_EXAMPLES_HOST_LOCATION ?= $(PWD)/docs/assets/examples
DOCS_SOURCE_LOCATION ?= $(PWD)/docs
DOCS_BUILD_DIRECTORY ?= _site
DOCS_BASE_URL ?= /dac
DOCS_HOST ?= 0.0.0.0
DOCS_PORT ?= 4000

sync-doc-examples:
	@set -e; \
	mkdir -p $(DOC_EXAMPLES_HOST_LOCATION); \
	for engine in $(DOC_EXAMPLE_ENGINES); do \
		mkdir -p "$(DOC_EXAMPLES_HOST_LOCATION)/$$engine"; \
		rm -f "$(DOC_EXAMPLES_HOST_LOCATION)/$$engine/"*.png; \
		if [ -d "$(OUTPUT_HOST_LOCATION)/$$engine" ]; then \
			find "$(OUTPUT_HOST_LOCATION)/$$engine" -type f -name '*.png' -exec cp -f {} "$(DOC_EXAMPLES_HOST_LOCATION)/$$engine/" \; ; \
		fi; \
	done

refresh-docs: render-all sync-doc-examples

docs-build:
	@mkdir -p "$(DOCS_SOURCE_LOCATION)"
	@set -e; \
	docker run --rm \
		-v "$(DOCS_SOURCE_LOCATION):/srv/jekyll" \
		-e BASE_URL="$(DOCS_BASE_URL)" \
		jekyll/jekyll:latest sh -lc 'gem install --no-document jekyll-theme-minimal >/dev/null && \
			jekyll build --source /srv/jekyll --destination /srv/jekyll/$(DOCS_BUILD_DIRECTORY) --config /srv/jekyll/_config.yml --baseurl "$$BASE_URL" --trace'

docs-serve:
	@mkdir -p "$(DOCS_SOURCE_LOCATION)"
	@echo "Serving docs at http://localhost:$(DOCS_PORT)/"
	@docker run --rm \
		-v "$(DOCS_SOURCE_LOCATION):/srv/jekyll" \
		-e BASE_URL="$(DOCS_BASE_URL)" \
		-p $(DOCS_HOST):$(DOCS_PORT):$(DOCS_PORT) \
		jekyll/jekyll:latest sh -lc 'gem install --no-document jekyll-theme-minimal >/dev/null && \
			jekyll serve --host 0.0.0.0 --port $(DOCS_PORT) --source /srv/jekyll --destination /srv/jekyll/$(DOCS_BUILD_DIRECTORY) --config /srv/jekyll/_config.yml --baseurl "$$BASE_URL" --livereload --trace'

test: run-container
	@set -e; \
	trap '$(MAKE) stop-container >/dev/null 2>&1 || true' EXIT INT TERM; \
	docker exec -t $(CONTAINER_NAME) sh /scripts/render_examples.sh; \
	OUTPUT_ROOT="$(OUTPUT_HOST_LOCATION)" sh scripts/verify_examples.sh

list:
	@printf "Examples\n"
	@printf "  py:\n"
	@printf "    easy, medium, complex, extreme, consumer\n"
	@printf "  puml:\n"
	@printf "    easy, medium, complex, extreme, test, test_c4, test_c4_complex_enterprise, test_c4_realtime_dispatch\n"
	@printf "  mermaid:\n"
	@printf "    easy, medium, complex, extreme\n"
	@printf "  dot:\n"
	@printf "    easy, medium, complex, extreme\n"
	@printf "  d2:\n"
	@printf "    easy, medium, complex, extreme\n"
	@printf "\nOutputs\n"
	@printf "  $(OUTPUT_HOST_LOCATION)/py/<name>/<name>.png\n"
	@printf "  $(OUTPUT_HOST_LOCATION)/uml/<name>.png\n"
	@printf "  $(OUTPUT_HOST_LOCATION)/mermaid/<name>.png\n"
	@printf "  $(OUTPUT_HOST_LOCATION)/dot/<name>.png\n"
	@printf "  $(OUTPUT_HOST_LOCATION)/d2/<name>.svg and $(OUTPUT_HOST_LOCATION)/d2/<name>.png\n"

version:
	@echo "$(DAC_VERSION)"

install-script:
	install -d "$(BINDIR)"
	install -m 0755 dac "$(BINDIR)/dac"

install-completion:
	install -d "$(BASH_COMPLETION_DIR)" "$(ZSH_COMPLETION_DIR)"
	install -m 0644 completions/dac.bash "$(BASH_COMPLETION_DIR)/dac"
	install -m 0644 completions/_dac "$(ZSH_COMPLETION_DIR)/_dac"

install: install-script install-completion
	@echo "installed dac $(DAC_VERSION) to $(BINDIR)/dac"
