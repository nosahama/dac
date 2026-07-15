# dac - Diagrams as Code

`dac` is a compact diagram-as-code playground with a single Docker-based workflow.

It currently supports these engines:

- Python `diagrams`
- PlantUML
- Mermaid
- Graphviz DOT
- D2

There is also a C4 PlantUML example using the standard C4 include files.

## Why this repo exists

The goal is to keep the workflow small:

- one container
- one `Makefile`
- sample inputs for easy, medium, and complex diagrams
- render outputs written to `./output`

## Quickstart

Build and start the renderer container:

```bash
make run-container
```

Run a quick environment check:

```bash
make doctor
```

List bundled examples and output locations:

```bash
make list
```

Render a single example with the shorthand target:

```bash
make render engine=py filename=easy
make render engine=puml filename=medium
make render engine=mermaid filename=complex
make render engine=dot filename=easy
make render engine=d2 filename=medium
```

Or use the engine-specific targets directly:

```bash
make generate-py filename=easy inputext=py
make generate-puml filename=easy inputext=puml
make generate-mermaid filename=easy inputext=mmd
make generate-dot filename=easy inputext=dot
make generate-d2 filename=easy inputext=d2
```

Render every bundled example:

```bash
make render-all
```

Run the full verification pass:

```bash
make test
```

Stop the container:

```bash
make stop-container
```

## Supported diagram types

### Python diagrams

Python diagrams are best when you want cloud architecture diagrams driven by Python code.

Example files:

- `diagrams/py/easy.py`
- `diagrams/py/medium.py`
- `diagrams/py/complex.py`
- `diagrams/py/extreme.py`
- `diagrams/py/consumer.py`

Render:

```bash
make generate-py filename=complex inputext=py
```

### PlantUML

PlantUML covers sequence diagrams, component diagrams, deployment diagrams, and more.

Example files:

- `diagrams/uml/easy.puml`
- `diagrams/uml/medium.puml`
- `diagrams/uml/complex.puml`
- `diagrams/uml/extreme.puml`
- `diagrams/uml/test.uml`
- `diagrams/uml/test_c4.puml`
- `diagrams/uml/test_c4_complex_enterprise.puml`
- `diagrams/uml/test_c4_realtime_dispatch.puml`

Render:

```bash
make generate-puml filename=complex inputext=puml
```

The C4 example uses a small local compatibility include so it renders without any external fetches.

### Mermaid

Mermaid is the easiest path for lightweight architecture, flowchart, and sequence diagrams in docs.
In this repo, Mermaid examples are rendered through Kroki, which keeps the container small and avoids browser setup.

Example files:

- `diagrams/mermaid/easy.mmd`
- `diagrams/mermaid/medium.mmd`
- `diagrams/mermaid/complex.mmd`
- `diagrams/mermaid/extreme.mmd`

Render:

```bash
make generate-mermaid filename=medium inputext=mmd
```

### Graphviz DOT

DOT is useful when you want direct layout control and a very stable rendering path.

Example files:

- `diagrams/dot/easy.dot`
- `diagrams/dot/medium.dot`
- `diagrams/dot/complex.dot`
- `diagrams/dot/extreme.dot`

Render:

```bash
make generate-dot filename=complex inputext=dot
```

### D2

D2 is a modern diagram scripting language with strong layout and styling support.

Example files:

- `diagrams/d2/easy.d2`
- `diagrams/d2/medium.d2`
- `diagrams/d2/complex.d2`
- `diagrams/d2/extreme.d2`

Render:

```bash
make generate-d2 filename=easy inputext=d2
```

## Output layout

Rendered PNGs are written to:

- `output/py/...`
- `output/uml/...`
- `output/mermaid/...`
- `output/dot/...`
- `output/d2/...`

D2 also keeps the native SVG output next to the PNG preview:

- `output/d2/*.svg`
- `output/d2/*.png`

## What `make test` checks

`make test` renders every example in the repository and verifies the expected PNG files exist and are non-empty.

That gives you a quick smoke test for:

- Python `diagrams`
- PlantUML
- Mermaid
- Graphviz DOT
- D2
- the C4 PlantUML sample
