#!/usr/bin/env sh
set -eu

required_paths="
output/py/easy/easy.png
output/py/medium/medium.png
output/py/complex/complex.png
output/py/consumer/consumer.png
output/uml/easy.png
output/uml/medium.png
output/uml/complex.png
output/uml/test.png
output/uml/test_c4.png
output/mermaid/easy.png
output/mermaid/medium.png
output/mermaid/complex.png
output/dot/easy.png
output/dot/medium.png
output/dot/complex.png
output/d2/easy.png
output/d2/medium.png
output/d2/complex.png
output/d2/easy.svg
output/d2/medium.svg
output/d2/complex.svg
"

status=0
for path in $required_paths; do
  if [ ! -s "$path" ]; then
    echo "missing or empty: $path" >&2
    status=1
  fi
done

exit "$status"
