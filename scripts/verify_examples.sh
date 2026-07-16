#!/usr/bin/env sh
set -eu

OUTPUT_ROOT="${OUTPUT_ROOT:-output}"

required_paths="
${OUTPUT_ROOT}/py/easy/easy.png
${OUTPUT_ROOT}/py/medium/medium.png
${OUTPUT_ROOT}/py/complex/complex.png
${OUTPUT_ROOT}/py/extreme/extreme.png
${OUTPUT_ROOT}/py/consumer/consumer.png
${OUTPUT_ROOT}/uml/easy.png
${OUTPUT_ROOT}/uml/medium.png
${OUTPUT_ROOT}/uml/complex.png
${OUTPUT_ROOT}/uml/extreme.png
${OUTPUT_ROOT}/uml/test.png
${OUTPUT_ROOT}/uml/test_c4.png
${OUTPUT_ROOT}/uml/test_c4_complex_enterprise.png
${OUTPUT_ROOT}/uml/test_c4_realtime_dispatch.png
${OUTPUT_ROOT}/mermaid/easy.png
${OUTPUT_ROOT}/mermaid/medium.png
${OUTPUT_ROOT}/mermaid/complex.png
${OUTPUT_ROOT}/mermaid/extreme.png
${OUTPUT_ROOT}/dot/easy.png
${OUTPUT_ROOT}/dot/medium.png
${OUTPUT_ROOT}/dot/complex.png
${OUTPUT_ROOT}/dot/extreme.png
${OUTPUT_ROOT}/d2/easy.png
${OUTPUT_ROOT}/d2/medium.png
${OUTPUT_ROOT}/d2/complex.png
${OUTPUT_ROOT}/d2/extreme.png
${OUTPUT_ROOT}/d2/easy.svg
${OUTPUT_ROOT}/d2/medium.svg
${OUTPUT_ROOT}/d2/complex.svg
${OUTPUT_ROOT}/d2/extreme.svg
"

status=0
for path in $required_paths; do
  if [ ! -s "$path" ]; then
    echo "missing or empty: $path" >&2
    status=1
  fi
done

exit "$status"
