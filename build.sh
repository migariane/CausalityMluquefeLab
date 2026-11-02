#!/usr/bin/env bash
# Render both language versions into one site tree.
#
# The English site is the root project; the Spanish site lives in es/ with
# its own _quarto.yml, so Quarto must be invoked separately inside it. The
# Spanish build is then copied into the English _site/es/ so that the
# language switch links (es/index.html <-> ../index.html) resolve.

set -euo pipefail

cd "$(dirname "$0")"
export PATH="/usr/local/bin:$PATH"

echo "== English =="
rm -rf _site .quarto
quarto render

echo "== Spanish =="
rm -rf es/_site es/.quarto
(cd es && quarto render)

rm -rf _site/es
cp -R es/_site _site/es

# Validate: both entry points must exist, and each must link to the other.
missing=0
for f in _site/index.html _site/es/index.html; do
  [ -f "$f" ] || { echo "MISSING: $f"; missing=1; }
done
[ "$missing" -eq 0 ] || exit 1

grep -q 'es/index.html' _site/index.html || { echo "English page has no ES switch"; exit 1; }
grep -q '\.\./index.html' _site/es/index.html || { echo "Spanish page has no EN switch"; exit 1; }

echo "Site ready in _site/ (English at /, Spanish at /es/)"
