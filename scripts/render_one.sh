#!/usr/bin/env sh
set -eu

engine="${1:-}"
name="${2:-}"
ext="${3:-}"

ROOT="${ROOT:-${DIAGRAMS_ROOT:-/diagrams}}"
OUTPUT_ROOT="${OUTPUT_ROOT:-${DGRAC_OUTPUT_ROOT:-/output}}"
PLANTUML_JAR="${PLANTUML_JAR:-/jars/plantuml.jar}"

if [ -z "$engine" ] || [ -z "$name" ]; then
  echo "usage: render_one.sh <engine> <name> [ext]" >&2
  exit 2
fi

render_python() {
  outdir="$OUTPUT_ROOT/py/$name"
  mkdir -p "$outdir"
  (cd "$outdir" && python3 "$ROOT/py/$name.py")
}

render_plantuml() {
  mkdir -p "$OUTPUT_ROOT/uml"
  cat "$ROOT/uml/$name.$ext" | java -jar "$PLANTUML_JAR" -tpng -pipe > "$OUTPUT_ROOT/uml/$name.png"
}

render_mermaid() {
  mkdir -p "$OUTPUT_ROOT/mermaid"
  curl -fsSL \
    -H 'Content-Type: text/plain' \
    --data-binary @"$ROOT/mermaid/$name.mmd" \
    https://kroki.io/mermaid/png \
    -o "$OUTPUT_ROOT/mermaid/$name.png"
}

render_dot() {
  mkdir -p "$OUTPUT_ROOT/dot"
  dot -Tpng "$ROOT/dot/$name.$ext" -o "$OUTPUT_ROOT/dot/$name.png"
}

render_d2() {
  mkdir -p "$OUTPUT_ROOT/d2"
  svg_file="$OUTPUT_ROOT/d2/$name.svg"
  png_file="$OUTPUT_ROOT/d2/$name.png"
  browser_bin="$(command -v chromium-browser || command -v chromium || true)"
  if [ -z "$browser_bin" ]; then
    echo "chromium not found in container" >&2
    exit 1
  fi
  d2 "$ROOT/d2/$name.$ext" "$svg_file"
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

case "$engine" in
  py)
    render_python
    ;;
  puml|uml)
    ext="${ext:-puml}"
    render_plantuml
    ;;
  mermaid)
    ext="${ext:-mmd}"
    render_mermaid
    ;;
  dot)
    ext="${ext:-dot}"
    render_dot
    ;;
  d2)
    ext="${ext:-d2}"
    render_d2
    ;;
  *)
    echo "unknown engine: $engine" >&2
    exit 2
    ;;
esac
