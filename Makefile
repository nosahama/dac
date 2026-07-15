CONTAINER_NAME = dac
IMAGE_NAME := $(CONTAINER_NAME)

JAVA_JARS_LOCATION := /jars
DIAGRAMS_CONTAINER_LOCATION := /diagrams
OUTPUT_CONTAINER_LOCATION := /output

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
	render render-all list doctor

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
	@echo "  render-all           render every sample example into ./output"
	@echo "  test                 render and verify every supported diagram type"

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
	@mkdir -p output
	@docker rm -f $(CONTAINER_NAME) >/dev/null 2>&1 || true
	docker run -d -v ${PWD}/diagrams:/diagrams -v ${PWD}/output:/output --name $(CONTAINER_NAME) $(IMAGE_NAME)

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
	$(MAKE) run-container >/dev/null; \
	case "$(engine)" in \
		py) ext="$${inputext:-py}"; $(MAKE) generate-py filename=$(filename) inputext="$$ext" ;; \
		puml|uml) ext="$${inputext:-puml}"; $(MAKE) generate-puml filename=$(filename) inputext="$$ext" ;; \
		mermaid) ext="$${inputext:-mmd}"; $(MAKE) generate-mermaid filename=$(filename) inputext="$$ext" ;; \
		dot) ext="$${inputext:-dot}"; $(MAKE) generate-dot filename=$(filename) inputext="$$ext" ;; \
		d2) ext="$${inputext:-d2}"; $(MAKE) generate-d2 filename=$(filename) inputext="$$ext" ;; \
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

test: run-container
	@set -e; \
	trap '$(MAKE) stop-container >/dev/null 2>&1 || true' EXIT INT TERM; \
	docker exec -t $(CONTAINER_NAME) sh /scripts/render_examples.sh; \
	sh scripts/verify_examples.sh

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
	@printf "  output/py/<name>/<name>.png\n"
	@printf "  output/uml/<name>.png\n"
	@printf "  output/mermaid/<name>.png\n"
	@printf "  output/dot/<name>.png\n"
	@printf "  output/d2/<name>.svg and output/d2/<name>.png\n"
