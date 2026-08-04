#!/usr/bin/env sh
set -eu

ROOT="${ROOT:-${DIAGRAMS_ROOT:-/diagrams}}"
OUTPUT_ROOT="${OUTPUT_ROOT:-${DGRAC_OUTPUT_ROOT:-/output}}"
PLANTUML_JAR="${PLANTUML_JAR:-/jars/plantuml.jar}"

render_python() {
  name="$1"
  outdir="$OUTPUT_ROOT/py/$name"
  mkdir -p "$outdir"
  (cd "$outdir" && python3 "$ROOT/py/$name.py")
}

render_plantuml() {
  name="$1"
  ext="${2:-puml}"
  mkdir -p "$OUTPUT_ROOT/uml"
  cat "$ROOT/uml/$name.$ext" | java -jar "$PLANTUML_JAR" -tpng -pipe > "$OUTPUT_ROOT/uml/$name.png"
}

render_mermaid() {
  name="$1"
  mkdir -p "$OUTPUT_ROOT/mermaid"
  curl -fsSL \
    -H 'Content-Type: text/plain' \
    --data-binary @"$ROOT/mermaid/$name.mmd" \
    https://kroki.io/mermaid/png \
    -o "$OUTPUT_ROOT/mermaid/$name.png"
}

render_dot() {
  name="$1"
  mkdir -p "$OUTPUT_ROOT/dot"
  dot -Tpng "$ROOT/dot/$name.dot" -o "$OUTPUT_ROOT/dot/$name.png"
}

render_d2() {
  name="$1"
  mkdir -p "$OUTPUT_ROOT/d2"
  svg_file="$OUTPUT_ROOT/d2/$name.svg"
  png_file="$OUTPUT_ROOT/d2/$name.png"
  browser_bin="$(command -v chromium-browser || command -v chromium || true)"
  if [ -z "$browser_bin" ]; then
    echo "chromium not found in container" >&2
    exit 1
  fi
  d2 "$ROOT/d2/$name.d2" "$svg_file"
  "$browser_bin" \
    --headless \
    --disable-gpu \
    --no-sandbox \
    --hide-scrollbars \
    --force-device-scale-factor=1 \
    --window-size=1800,1200 \
    --screenshot="$png_file" \
    "file://$svg_file" >/dev/null 2>&1
}

for example in easy medium complex extreme; do
  render_python "$example"
  render_plantuml "$example"
  render_mermaid "$example"
  render_dot "$example"
  render_d2 "$example"
done

render_python consumer
render_plantuml test uml
render_plantuml test_c4 puml
render_plantuml test_c4_complex_enterprise puml
render_plantuml test_c4_realtime_dispatch puml
