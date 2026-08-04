# dgrac - Diagrams as Code

> **All-in-one diagram-as-code playground**: Python diagrams, PlantUML, Mermaid, Graphviz & D2 in one Docker container. Zero setup complexity. Perfect for architecture docs, CI/CD pipelines, and infrastructure visualization.

`dgrac` is a compact diagram-as-code playground with a single Docker-based workflow.

## ⚡ Quick Start (30 seconds)

```bash
# Build the container
make run-container

# Verify everything works
make doctor

# Render all examples
make render-all

# View outputs in ./output
```

That's it! All diagram engines ready to go.

## 🎯 Why dgrac?

| Feature | Benefit |
|---------|---------|
| **Single Makefile** | No npm, pip, or complex setup. Just `make`. |
| **One Docker container** | All 5 engines in one container—no dependencies sprawl. |
| **Zero configuration** | Works out-of-the-box with curated examples. |
| **CI/CD ready** | Perfect for automated architecture documentation pipelines. |
| **Engine agnostic** | Learn or switch between tools easily with the same workflow. |

## 📊 Supported Diagram Engines

### Python diagrams
Best for cloud architecture diagrams driven by Python code.

```bash
make render engine=py filename=easy
make render engine=py filename=medium
make render engine=py filename=complex
```

**Examples:**
- Cloud infrastructure (AWS, GCP, Azure)
- Microservices architecture
- Network topology

### PlantUML
Covers sequence diagrams, component diagrams, deployment diagrams, and more. Includes **C4 model support** with built-in compatibility includes (no external fetches needed).

```bash
make render engine=puml filename=medium
make render engine=puml filename=test_c4
```

**Examples:**
- Sequence diagrams
- Component & deployment diagrams
- C4 architecture models

### Mermaid
The easiest path for lightweight architecture, flowchart, and sequence diagrams in docs. Renders through Kroki.

```bash
make render engine=mermaid filename=easy
```

**Examples:**
- Architecture diagrams
- Flowcharts
- Sequence & state diagrams
- Great for embedding in Markdown docs

### Graphviz DOT
Useful when you want direct layout control and a very stable rendering path.

```bash
make render engine=dot filename=complex
```

**Examples:**
- Dependency graphs
- State machines
- Custom layouts with precise control

### D2
A modern diagram scripting language with strong layout and styling support. Outputs both SVG and PNG.

```bash
make render engine=d2 filename=medium
```

**Examples:**
- Modern architecture diagrams
- Entity relationship diagrams
- Timeline diagrams

## 🚀 Common Workflows

### Render a single diagram
```bash
make render engine=py filename=easy         # Python
make render engine=puml filename=medium     # PlantUML
make render engine=mermaid filename=easy    # Mermaid
make render engine=dot filename=complex     # Graphviz
make render engine=d2 filename=medium       # D2
```

### Render all examples
```bash
make render-all
make sync-doc-examples
```

`sync-doc-examples` keeps `docs/assets/examples/` synchronized with rendered PNGs so the site gallery pages stay current.

### Verify setup
```bash
make doctor
```

### List available examples
```bash
make list
```

### Run full test suite
```bash
make test
```

### Refresh docs gallery assets
```bash
make refresh-docs
```

### Stop the container
```bash
make stop-container
```

You can also run this repo against another project with the same engine layout (`py`, `uml`, `mermaid`, `dot`, `d2`).

#### Make mode
```bash
make -C /opt/projects/labs/dgrac render \
  DIAGRAMS_HOST_LOCATION=/opt/projects/stonetoned/bandai/infra \
  OUTPUT_HOST_LOCATION=/tmp/bandai-infra-diagrams \
  engine=puml \
  filename=stack \
  inputext=puml
```

#### CLI mode (recommended for reusable tool usage)
```bash
/opt/projects/labs/dgrac/dgrac render \
  --source /opt/projects/stonetoned/bandai/infra \
  --engine puml \
  --name stack \
  --ext puml \
  --out /tmp/bandai-infra-diagrams
```

CLI arguments:
- `--source` / `--source-dir`: absolute input directory
- `--out` / `--output` / `--output-dir`: output directory
- `--engine`: `py|puml|uml|mermaid|dot|d2`
- `--name`: diagram name
- `--ext` / `--inputext`: extension override (`py/puml/mmd/dot/d2`)
- `--help`: print help
- `--version`: print version

## 📂 Project Structure

```
dgrac/
├── diagrams/
│   ├── py/          # Python diagram examples
│   ├── uml/         # PlantUML examples (including C4)
│   ├── mermaid/     # Mermaid examples
│   ├── dot/         # Graphviz DOT examples
│   └── d2/          # D2 examples
├── output/          # Generated PNG/SVG outputs
├── Makefile         # All build commands
├── Dockerfile       # Single containerized environment
└── README.md
```

## 📤 Output Locations

Rendered diagrams are organized by engine:

- **Python:** `output/py/...`
- **PlantUML:** `output/uml/...`
- **Mermaid:** `output/mermaid/...`
- **Graphviz:** `output/dot/...`
- **D2:** `output/d2/...` (includes both `.svg` and `.png`)

## 🧪 Testing
```bash
make test
```

The test suite:
- Renders every example in the repository
- Verifies expected PNG files exist and are non-empty
- Validates all 5 engines + C4 PlantUML sample
- Gives you a quick smoke test for your setup

## 🌐 Use Cases
- **Architecture Documentation** — Generate diagrams as part of your documentation build
- **CI/CD Pipelines** — Auto-render diagrams on every commit
- **Infrastructure as Code** — Visualize your infrastructure definitions
- **Technical Design Docs** — Create sequence, component, and deployment diagrams
- **Learning Playground** — Experiment with different diagram engines and syntax

## Install & versioning
```bash
cat VERSION
make version
```

```bash
make install PREFIX=$HOME/.local
make install-completion PREFIX=$HOME/.local
```

```bash
dgrac --version
dgrac version
```

`VERSION` is the semantic version source. Current value is `0.1.1`.

## Supported diagram types

### Python diagrams

- `diagrams/py/easy.py`
- `diagrams/py/medium.py`
- `diagrams/py/complex.py`
- `diagrams/py/extreme.py`
- `diagrams/py/consumer.py`

Render:
```bash
make generate-py filename=easy inputext=py
```

### PlantUML

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

The C4 example uses a small local compatibility include so it renders without external fetches.

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

To change this in the same run, set:

- `DIAGRAMS_HOST_LOCATION` (default: `./diagrams`)
- `OUTPUT_HOST_LOCATION` (default: `./output`)

## What `make test` checks

`make test` renders every example in the repository and verifies the expected PNG files exist and are non-empty.

That gives you a quick smoke test for:

- Python `diagrams`
- PlantUML
- Mermaid
- Graphviz DOT
- D2
- the C4 PlantUML sample

## 📋 What's Included

This repo provides:
- **5 diagram engines** — compare and choose what works for you
- **Sample inputs** for easy, medium, and complex diagrams per engine
- **C4 PlantUML** — industry-standard architecture modeling
- **Docker containerization** — reproducible environment
- **Makefile automation** — simple, explicit commands
- **Comprehensive examples** — from basic to advanced

## 🔧 Requirements

- Docker
- Make
- That's it!

## 📝 License

Creative Commons Zero v1.0 Universal (CC0) — Use freely, no attribution required.

## 🤝 Contributing

Found a bug? Have a great example? Issues and PRs welcome!

---
