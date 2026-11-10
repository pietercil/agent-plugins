#!/usr/bin/env bash
# Stop hook: when production code changed but no doc was touched, ask Claude
# to run the check skill once. Silent otherwise. Never fails the session.

input=$(cat)

# Loop guard: Claude is already continuing because a Stop hook ran.
if printf '%s' "$input" | grep -Eq '"stop_hook_active"[[:space:]]*:[[:space:]]*true'; then
  exit 0
fi

config="docs/agents/documentation.md"
[ -f "$config" ] || exit 0

setting() {
  sed -n "s/^- $1:[[:space:]]*//p" "$config" | head -n 1 | tr -d '\r'
}

code_paths=$(setting code-paths)
doc_paths=$(setting doc-paths)
changelog=$(setting changelog)
fragments_path=$(setting fragments-path)
[ -n "$code_paths" ] || exit 0

changed=$( { git diff --name-only HEAD 2>/dev/null; git ls-files --others --exclude-standard 2>/dev/null; } | sort -u)
[ -n "$changed" ] || exit 0

# Does a changed file live under one of the space-separated path prefixes?
touches() {
  local prefixes=$1 file prefix
  while IFS= read -r file; do
    for prefix in $prefixes; do
      case "$file" in "$prefix"*) return 0 ;; esac
    done
  done <<< "$changed"
  return 1
}

touches "$code_paths" || exit 0

doc_like="$doc_paths docs/agents/documentation.md"
[ "$changelog" = "on" ] && doc_like="$doc_like $fragments_path"
touches "$doc_like" && exit 0

# Nudge once per distinct set of changed files per session.
session=$(printf '%s' "$input" | sed -n 's/.*"session_id"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -n 1)
state_dir="${CLAUDE_PLUGIN_DATA:-${TMPDIR:-/tmp}}"
mkdir -p "$state_dir" 2>/dev/null
marker="$state_dir/doc-drift-${session:-nosession}"
fingerprint=$(printf '%s' "$changed" | cksum)
if [ -f "$marker" ] && [ "$(cat "$marker")" = "$fingerprint" ]; then
  exit 0
fi
printf '%s' "$fingerprint" > "$marker" 2>/dev/null

printf '%s\n' '{"decision":"block","reason":"Production code changed but no documentation was touched. Run the ship-of-theseus check skill to look for Doc Drift. If docs need updating, run distill; if the Change genuinely needs no doc change, say so in one line and finish."}'
exit 0
