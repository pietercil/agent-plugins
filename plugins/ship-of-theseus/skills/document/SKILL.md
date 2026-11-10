---
name: document
description: "Write or refresh one Living Doc type for one scope, such as an existing module's Architecture Overview."
---

# Document

Takes a doc type and a scope; ask for whichever is missing.

## Process

1. Read `docs/agents/documentation.md` for the type's location and settings. Missing: tell the user to run `/ship-of-theseus:setup` and stop.
2. Read the scope's code and its existing docs. Done when every public item in the scope (endpoint, setting, entry point, module boundary, whichever the type covers) has been read.
3. Write the doc following [DOC-TYPES.md](./DOC-TYPES.md), using `GLOSSARY.md` terms. Keep to the scope: several small reviewable docs serve better than one dump.
4. Reference: run `reference-command` if set; otherwise write a minimal Reference by hand and say so at the top of the file.
5. Finish with a list of statements you could not verify from the code. Every statement in the doc comes from code you read. Leave changes uncommitted.
