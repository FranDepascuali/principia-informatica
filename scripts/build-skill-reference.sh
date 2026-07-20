#!/usr/bin/env bash
# Regenerate the skill's proposition bundle from the canonical source.
#
# Single source of truth: propositions/[0-9]*.md
# Generated output:       skills/principia-informatica/references/propositions.md
#
# Run this after adding or amending any proposition. The output file is a
# build artifact: never edit it by hand, edit the source proposition instead.
set -euo pipefail

cd "$(dirname "$0")/.."

out="skills/principia-informatica/references/propositions.md"

{
  echo "# Propositions (compiled)"
  echo
  echo "Generated from propositions/[0-9]*.md by scripts/build-skill-reference.sh."
  echo "Do not edit by hand: edit the source proposition and regenerate."
  echo
  for f in propositions/[0-9]*.md; do
    cat "$f"
    printf '\n\n---\n\n'
  done
} > "$out"

echo "Wrote $out from $(ls propositions/[0-9]*.md | wc -l | tr -d ' ') propositions."
