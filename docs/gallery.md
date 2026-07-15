---
layout: default
title: Gallery - Diagram Examples
---

# 🎨 Diagram Gallery

Explore beautiful examples rendered from each diagram engine. Click on any engine to see what's possible!

---

## 📊 Interactive Engine Showcase

<style>
.engine-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 20px;
  margin: 30px 0;
}

.engine-card {
  border: 2px solid #e0e0e0;
  border-radius: 10px;
  padding: 20px;
  background: linear-gradient(135deg, #f5f5f5 0%, #ffffff 100%);
  transition: all 0.3s ease;
  cursor: pointer;
}

.engine-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 16px rgba(0,0,0,0.15);
  border-color: #0366d6;
}

.engine-icon {
  font-size: 2.5em;
  margin-bottom: 10px;
}

.engine-title {
  font-size: 1.3em;
  font-weight: bold;
  margin: 10px 0;
  color: #0366d6;
}

.engine-desc {
  font-size: 0.9em;
  color: #666;
  margin: 10px 0;
}

.example-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 15px;
  margin: 20px 0;
}

.example-item {
  background: white;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  overflow: hidden;
  transition: all 0.3s ease;
}

.example-item:hover {
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

.example-thumb {
  width: 100%;
  height: 200px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-weight: bold;
  text-align: center;
  padding: 20px;
  box-sizing: border-box;
  font-size: 1.1em;
}

.example-info {
  padding: 15px;
}

.example-name {
  font-weight: bold;
  color: #0366d6;
  margin-bottom: 5px;
}

.example-type {
  font-size: 0.85em;
  color: #666;
  margin-bottom: 10px;
}

.example-btn {
  display: inline-block;
  padding: 6px 12px;
  background: #0366d6;
  color: white;
  border-radius: 5px;
  text-decoration: none;
  font-size: 0.85em;
  transition: background 0.2s;
}

.example-btn:hover {
  background: #0256ba;
  text-decoration: none;
}

.complexity-badge {
  display: inline-block;
  padding: 3px 8px;
  background: #f0f0f0;
  border-radius: 3px;
  font-size: 0.75em;
  margin-left: 5px;
  color: #666;
}

.easy { background-color: #c8e6c9; color: #1b5e20; }
.medium { background-color: #ffe0b2; color: #e65100; }
.complex { background-color: #ffcdd2; color: #b71c1c; }

.tabs {
  display: flex;
  gap: 10px;
  margin: 20px 0;
  border-bottom: 2px solid #e0e0e0;
  flex-wrap: wrap;
}

.tab-btn {
  padding: 10px 20px;
  border: none;
  background: white;
  cursor: pointer;
  font-weight: 500;
  color: #666;
  border-bottom: 3px solid transparent;
  transition: all 0.2s;
}

.tab-btn:hover {
  color: #0366d6;
}

.tab-btn.active {
  color: #0366d6;
  border-bottom-color: #0366d6;
}

.tab-content {
  display: none;
}

.tab-content.active {
  display: block;
}

.feature-list {
  list-style: none;
  padding: 0;
}

.feature-list li {
  padding: 8px 0;
  border-bottom: 1px solid #e0e0e0;
}

.feature-list li:before {
  content: "✓ ";
  color: #28a745;
  font-weight: bold;
  margin-right: 8px;
}

.feature-list li:last-child {
  border-bottom: none;
}
</style>

<div class="engine-grid">
  <!-- Python Diagrams -->
  <div class="engine-card" onclick="switchTab('python')">
    <div class="engine-icon">🐍</div>
    <div class="engine-title">Python Diagrams</div>
    <div class="engine-desc">Cloud architecture & infrastructure</div>
    <div class="feature-list">
      <li>AWS, GCP, Azure</li>
      <li>Code-driven</li>
      <li>Professional</li>
    </div>
  </div>

  <!-- PlantUML -->
  <div class="engine-card" onclick="switchTab('plantuml')">
    <div class="engine-icon">📊</div>
    <div class="engine-title">PlantUML</div>
    <div class="engine-desc">UML, sequences & C4 models</div>
    <div class="feature-list">
      <li>Sequence diagrams</li>
      <li>C4 models</li>
      <li>Component diagrams</li>
    </div>
  </div>

  <!-- Mermaid -->
  <div class="engine-card" onclick="switchTab('mermaid')">
    <div class="engine-icon">🧠</div>
    <div class="engine-title">Mermaid</div>
    <div class="engine-desc">Modern, lightweight diagrams</div>
    <div class="feature-list">
      <li>Flowcharts</li>
      <li>State diagrams</li>
      <li>Very easy</li>
    </div>
  </div>

  <!-- Graphviz -->
  <div class="engine-card" onclick="switchTab('graphviz')">
    <div class="engine-icon">🕸️</div>
    <div class="engine-title">Graphviz DOT</div>
    <div class="engine-desc">Precise control & layouts</div>
    <div class="feature-list">
      <li>Custom layouts</li>
      <li>Dependency graphs</li>
      <li>Stable</li>
    </div>
  </div>

  <!-- D2 -->
  <div class="engine-card" onclick="switchTab('d2')">
    <div class="engine-icon">🎯</div>
    <div class="engine-title">D2</div>
    <div class="engine-desc">Modern syntax with styling</div>
    <div class="feature-list">
      <li>Beautiful by default</li>
      <li>SVG & PNG output</li>
      <li>Flexible</li>
    </div>
  </div>
</div>

---

## 📸 Example Outputs

<div class="tabs">
  <button class="tab-btn active" onclick="switchTab('python')">Python</button>
  <button class="tab-btn" onclick="switchTab('plantuml')">PlantUML</button>
  <button class="tab-btn" onclick="switchTab('mermaid')">Mermaid</button>
  <button class="tab-btn" onclick="switchTab('graphviz')">Graphviz</button>
  <button class="tab-btn" onclick="switchTab('d2')">D2</button>
</div>

<!-- Python Examples -->
<div id="python" class="tab-content active">
### Python Diagrams Examples

Cloud architecture diagrams created with Python code.

<div class="example-grid">
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">Python Easy<br><span class="complexity-badge easy">Easy</span></div>
    <div class="example-info">
      <div class="example-name">Basic AWS Architecture</div>
      <div class="example-type">Simple cloud setup</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
  
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">Python Medium<br><span class="complexity-badge medium">Medium</span></div>
    <div class="example-info">
      <div class="example-name">Microservices Architecture</div>
      <div class="example-type">Multi-tier deployment</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
  
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">Python Complex<br><span class="complexity-badge complex">Complex</span></div>
    <div class="example-info">
      <div class="example-name">Enterprise Infrastructure</div>
      <div class="example-type">Full system architecture</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
</div>
</div>

<!-- PlantUML Examples -->
<div id="plantuml" class="tab-content">
### PlantUML Examples

UML diagrams and C4 models for technical documentation.

<div class="example-grid">
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);">PlantUML Easy<br><span class="complexity-badge easy">Easy</span></div>
    <div class="example-info">
      <div class="example-name">Class Diagram</div>
      <div class="example-type">Object-oriented design</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
  
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);">PlantUML Medium<br><span class="complexity-badge medium">Medium</span></div>
    <div class="example-info">
      <div class="example-name">Sequence Diagram</div>
      <div class="example-type">System interactions</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
  
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #ff9a56 0%, #ff6a88 100%);">C4 Model<br><span class="complexity-badge complex">Complex</span></div>
    <div class="example-info">
      <div class="example-name">C4 Architecture Model</div>
      <div class="example-type">Enterprise architecture</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
</div>
</div>

<!-- Mermaid Examples -->
<div id="mermaid" class="tab-content">
### Mermaid Examples

Modern, lightweight diagrams perfect for documentation.

<div class="example-grid">
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">Mermaid Easy<br><span class="complexity-badge easy">Easy</span></div>
    <div class="example-info">
      <div class="example-name">Flowchart</div>
      <div class="example-type">Process flow</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
  
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">Mermaid Medium<br><span class="complexity-badge medium">Medium</span></div>
    <div class="example-info">
      <div class="example-name">State Diagram</div>
      <div class="example-type">System states</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
  
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">Mermaid Complex<br><span class="complexity-badge complex">Complex</span></div>
    <div class="example-info">
      <div class="example-name">Sequence & Architecture</div>
      <div class="example-type">Combined diagrams</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
</div>
</div>

<!-- Graphviz Examples -->
<div id="graphviz" class="tab-content">
### Graphviz DOT Examples

Precise control with powerful layout algorithms.

<div class="example-grid">
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);">Graphviz Easy<br><span class="complexity-badge easy">Easy</span></div>
    <div class="example-info">
      <div class="example-name">Simple Graph</div>
      <div class="example-type">Node relationships</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
  
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);">Graphviz Medium<br><span class="complexity-badge medium">Medium</span></div>
    <div class="example-info">
      <div class="example-name">Dependency Graph</div>
      <div class="example-type">Module relationships</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
  
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #ff9a56 0%, #ff6a88 100%);">Graphviz Complex<br><span class="complexity-badge complex">Complex</span></div>
    <div class="example-info">
      <div class="example-name">State Machine</div>
      <div class="example-type">Complex flows</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
</div>
</div>

<!-- D2 Examples -->
<div id="d2" class="tab-content">
### D2 Examples

Modern syntax with beautiful default styling.

<div class="example-grid">
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">D2 Easy<br><span class="complexity-badge easy">Easy</span></div>
    <div class="example-info">
      <div class="example-name">Entity Relationship</div>
      <div class="example-type">Database schema</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
  
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">D2 Medium<br><span class="complexity-badge medium">Medium</span></div>
    <div class="example-info">
      <div class="example-name">System Architecture</div>
      <div class="example-type">Service diagram</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
  
  <div class="example-item">
    <div class="example-thumb" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">D2 Complex<br><span class="complexity-badge complex">Complex</span></div>
    <div class="example-info">
      <div class="example-name">Timeline Diagram</div>
      <div class="example-type">Multi-layer design</div>
      <a href="#" class="example-btn">View Full Size</a>
    </div>
  </div>
</div>
</div>

---

## 🚀 Generate Your Own

Want to create these diagrams yourself? It's easy!

```bash
# Clone the repository
git clone https://github.com/nosahama/dac.git
cd dac

# Start the Docker container
make run-container

# Render all examples
make render-all

# Or render specific examples
make render engine=py filename=easy
make render engine=puml filename=medium
make render engine=mermaid filename=complex
```

All outputs will be in `./output/` directory, ready to use!

---

## 💡 Tips

- ✅ Modify the source files in `diagrams/*/` to customize
- ✅ Each engine has easy, medium, and complex examples
- ✅ All examples are production-ready
- ✅ Run `make test` to verify everything works

<script>
function switchTab(tabName) {
  // Hide all tab contents
  const contents = document.querySelectorAll('.tab-content');
  contents.forEach(content => content.classList.remove('active'));
  
  // Remove active class from all buttons
  const buttons = document.querySelectorAll('.tab-btn');
  buttons.forEach(btn => btn.classList.remove('active'));
  
  // Show selected tab content
  const selected = document.getElementById(tabName);
  if (selected) {
    selected.classList.add('active');
  }
  
  // Add active class to clicked button
  if (event && event.target) {
    event.target.classList.add('active');
  }
}
</script>
