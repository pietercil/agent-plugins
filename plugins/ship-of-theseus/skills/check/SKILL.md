---
name: check
description: "Report Doc Drift between the current Change and the Living Docs. Read-only."
---

# Check for Doc Drift

Report findings; `distill` and `document` fix them. This skill reads files and edits none.

## Process

1. Read `docs/agents/documentation.md`. Missing: tell the user to run `/ship-of-theseus:setup` and stop.
2. Collect the Change: diff against the default branch plus uncommitted and untracked files.
3. Classify it and look up its Matrix row as `distill` step 2 does. `maybe` columns count with a concrete reason.
4. Compare. Done when every new or changed endpoint, setting, rule, runbook step and term in the diff has been searched for in the docs of each applicable type, and every doc statement about changed code has been checked against that code.
5. With `changelog: on` and a user-visible Change, confirm a Change Fragment exists in `fragments-path`.

## Output

One line per finding, backed by code evidence:

```
<doc path> - <what is missing or false> - <file:line or diff hunk>
```

Finish with `No Doc Drift found.` or `Run /ship-of-theseus:distill to fix.`
