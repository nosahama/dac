# dac - Diagrams as Code

[📚 View Gallery](/dac/gallery.html){: .btn .btn-primary } [🏠 Home](#){: .btn .btn-secondary }

---

Welcome to **dac**, the all-in-one diagram-as-code playground with zero setup complexity.

## What is dac?

`dac` brings together **5 professional diagram engines** in a single Docker container with one Makefile. No npm, no pip, no dependency hell—just run `make` and get beautiful diagrams.

### Supported Engines

- **Python diagrams** — Cloud architecture & infrastructure
- **PlantUML** — UML, sequences, components, C4 models
- **Mermaid** — Modern flowcharts, architecture, state diagrams
- **Graphviz DOT** — Precise control, dependency graphs
- **D2** — Modern syntax with strong styling

## Why dac?

### Problem
Diagram-as-code tools are powerful but scattered:
- Each engine requires different setup
- Dependencies vary widely
- No single workflow for learning or comparing them
- Hard to integrate into CI/CD pipelines

### Solution
**One container. One Makefile. All engines ready.**

```bash
make run-container
make render-all
# Done! All 5 engines rendered and ready in ./output
```

## Key Features

✨ **Zero Setup** — Everything containerized, works on any system with Docker
🎯 **Engine Comparison** — Learn and compare all 5 engines side-by-side
🚀 **CI/CD Ready** — Perfect for automated documentation pipelines
📚 **Well Documented** — Curated examples for easy, medium, and complex diagrams
🔧 **Simple Commands** — Intuitive `make` targets, no cryptic CLI flags

## Quick Start

### 1. Clone & Enter Directory
```bash
git clone https://github.com/nosahama/dac.git
cd dac
```

### 2. Start Container
```bash
make run-container
```

### 3. Verify Setup
```bash
make doctor
```

### 4. Render Examples
```bash
make render-all
```

### 5. View Results
Open any PNG in `./output/` to see your diagrams!

## Render Individual Diagrams

### Python Diagrams (Cloud Architecture)
```bash
make render engine=py filename=easy
make render engine=py filename=complex
```

### PlantUML (UML & Sequences)
```bash
make render engine=puml filename=medium
make render engine=puml filename=test_c4
```

### Mermaid (Lightweight & Modern)
```bash
make render engine=mermaid filename=easy
```

### Graphviz (Precise Control)
```bash
make render engine=dot filename=complex
```

### D2 (Modern Syntax)
```bash
make render engine=d2 filename=medium
```

## Engine Comparison

| Engine | Best For | Learning Curve | Output Format |
|--------|----------|-----------------|----------------|
| **Python diagrams** | Cloud/infrastructure | Moderate | PNG |
| **PlantUML** | UML, sequences, C4 | Low | PNG |
| **Mermaid** | Quick diagrams, docs | Very Low | PNG |
| **Graphviz DOT** | Precise layouts | Moderate | PNG |
| **D2** | Modern styling | Low-Moderate | PNG + SVG |

## Example Use Cases

### Architecture Documentation
```bash
# Generate architecture diagrams as part of docs build
make render engine=py filename=complex
# Commit output PNG to repo for consistency
```

### CI/CD Integration
```bash
# Render diagrams on every commit
make test  # Verifies all engines work
```

### Learning Playground
```bash
# Try each engine with the same example
make render engine=py filename=easy
make render engine=puml filename=easy
make render engine=mermaid filename=easy
# Compare approaches and syntaxes
```

### Infrastructure Visualization
```bash
# Document your cloud architecture as code
make render engine=py filename=complex
# PNG automatically updated when infrastructure changes
```

## Project Structure

```
dac/
├── diagrams/
│   ├── py/          # Python diagram source files
│   ├── uml/         # PlantUML source files
│   ├── mermaid/     # Mermaid source files
│   ├── dot/         # Graphviz DOT source files
│   └── d2/          # D2 source files
├── output/          # Generated PNG/SVG files
├── Makefile         # Build commands
├── Dockerfile       # Containerized environment
├── docs/
│   └── index.md     # This file
└── README.md        # Quick reference
```

## Make Targets Reference

| Command | Purpose |
|---------|----------|
| `make run-container` | Build and start the Docker container |
| `make doctor` | Verify all engines work correctly |
| `make list` | Show available examples |
| `make render engine=X filename=Y` | Render specific diagram |
| `make render-all` | Render every example |
| `make test` | Run full verification suite |
| `make stop-container` | Stop and clean up container |

## Testing & Verification

```bash
# Full test suite - renders all examples and verifies output
make test
```

This ensures:
- ✅ Python diagrams work
- ✅ PlantUML (including C4) works
- ✅ Mermaid works
- ✅ Graphviz DOT works
- ✅ D2 works
- ✅ All output files are valid and non-empty

## Tips & Tricks

### View All Available Examples
```bash
make list
```

### Render in Batch
```bash
# Render all Python examples
make render engine=py filename=easy && \
make render engine=py filename=medium && \
make render engine=py filename=complex
```

### Debug a Failing Render
```bash
make doctor  # Check if tools are installed correctly
make test    # Run full suite and see which step fails
```

## System Requirements

- **Docker** — Required to run containerized environment
- **Make** — For build automation
- **~1GB disk space** — For container and output files

## License

Creative Commons Zero v1.0 Universal (CC0) — Use freely with no attribution required.

## Getting Help

- Check `make list` to see available examples
- Run `make doctor` to diagnose issues
- Review example source files in `diagrams/*/`
- Open an issue on GitHub for bugs or feature requests

---

## Next Steps

1. **Clone the repo** — `git clone https://github.com/nosahama/dac.git`
2. **Start the container** — `make run-container`
3. **Render examples** — `make render-all`
4. **Explore outputs** — Check `./output/` for results
5. **Modify examples** — Edit files in `diagrams/*/` and re-render
6. **Integrate into your workflow** — Use `make` targets in docs builds or CI/CD

**Happy diagramming!** 🎨

---

<style>
.btn {
  display: inline-block;
  padding: 10px 20px;
  margin: 5px 5px 5px 0;
  border-radius: 5px;
  text-decoration: none;
  font-weight: bold;
  transition: all 0.3s;
}
.btn-primary {
  background-color: #0366d6;
  color: white;
}
.btn-primary:hover {
  background-color: #0256ba;
  text-decoration: none;
}
.btn-secondary {
  background-color: #6f42c1;
  color: white;
}
.btn-secondary:hover {
  background-color: #5a32a3;
  text-decoration: none;
}
</style>
