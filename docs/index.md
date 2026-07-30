---
layout: default
title: "dac - Diagrams as Code"
---

# dac - Diagrams as Code

<div class="page-actions">
  <a href="{{ site.baseurl }}/gallery.html" class="btn btn-primary">📚 View Gallery</a>
  <a href="{{ site.baseurl }}/" class="btn btn-secondary">🏠 Home</a>
</div>

---

## Sample Output Snapshots

<div class="sample-output-grid">
  <a href="{{ site.baseurl }}/assets/examples/py/easy.png" target="_blank">
    <img src="{{ site.baseurl }}/assets/examples/py/easy.png" alt="Python easy output" />
  </a>
  <a href="{{ site.baseurl }}/assets/examples/uml/easy.png" target="_blank">
    <img src="{{ site.baseurl }}/assets/examples/uml/easy.png" alt="PlantUML easy output" />
  </a>
  <a href="{{ site.baseurl }}/assets/examples/mermaid/medium.png" target="_blank">
    <img src="{{ site.baseurl }}/assets/examples/mermaid/medium.png" alt="Mermaid medium output" />
  </a>
  <a href="{{ site.baseurl }}/assets/examples/dot/medium.png" target="_blank">
    <img src="{{ site.baseurl }}/assets/examples/dot/medium.png" alt="Graphviz medium output" />
  </a>
  <a href="{{ site.baseurl }}/assets/examples/py/complex.png" target="_blank">
    <img src="{{ site.baseurl }}/assets/examples/py/complex.png" alt="Python complex output" />
  </a>
  <a href="{{ site.baseurl }}/assets/examples/d2/complex.png" target="_blank">
    <img src="{{ site.baseurl }}/assets/examples/d2/complex.png" alt="D2 complex output" />
  </a>
</div>

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
