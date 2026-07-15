# dac - Diagrams as Code

> **All-in-one diagram-as-code playground**: Python diagrams, PlantUML, Mermaid, Graphviz & D2 in one Docker container. Zero setup complexity. Perfect for architecture docs, CI/CD pipelines, and infrastructure visualization.

`dac` is a compact diagram-as-code playground with a single Docker-based workflow.

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

## 🎯 Why dac?

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
```

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

### Stop the container
```bash
make stop-container
```

## 📂 Project Structure

```
dac/
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

**Start diagramming now:** `make run-container && make render-all`
