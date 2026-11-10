#!/usr/bin/env bash
# Exercises the Stop hook against a throwaway git repo.
# Usage: bash tests/doc-drift-hook.test.sh
set -u

hook="$(cd "$(dirname "$0")/.." && pwd)/plugins/ship-of-theseus/scripts/doc-drift-hook.sh"
work=$(mktemp -d)
export CLAUDE_PLUGIN_DATA="$work/state"
trap 'rm -rf "$work"' EXIT

repo="$work/repo"
mkdir -p "$repo/src" "$repo/docs/agents"
cd "$repo" || exit 1
git init -q
git config user.email test@example.com
git config user.name test
printf '%s\n' '- code-paths: src/' '- doc-paths: docs/' '- changelog: off' '- fragments-path: docs/changes/unreleased/' > docs/agents/documentation.md
echo a > src/a.txt
git add -A
git commit -qm init

failures=0
expect() { # name, expected (nudge|silent), session, stdin json
  local out
  out=$(printf '%s' "$4" | bash "$hook")
  local got=silent
  [ -n "$out" ] && got=nudge
  if [ "$got" = "$2" ]; then echo "ok   $1"; else echo "FAIL $1 (expected $2, got $got)"; failures=$((failures + 1)); fi
}

expect "clean tree is silent" silent s1 '{"session_id":"s1"}'
echo b >> src/a.txt
expect "code change without docs nudges" nudge s1 '{"session_id":"s1"}'
expect "same change set nudges only once" silent s1 '{"session_id":"s1"}'
expect "stop_hook_active never nudges" silent s2 '{"session_id":"s2","stop_hook_active":true}'
echo c > src/b.txt
expect "new change set nudges again" nudge s1 '{"session_id":"s1"}'
echo d > docs/x.md
expect "docs touched alongside code is silent" silent s3 '{"session_id":"s3"}'

exit "$failures"
