---
name: setup
description: "Configure ship-of-theseus for this repo: code paths, audiences, changelog on/off, reference command. Writes docs/agents/documentation.md; re-runnable."
disable-model-invocation: true
---

# Set up ship-of-theseus

Write `docs/agents/documentation.md` from [documentation.template.md](./documentation.template.md) and wire it into the agent docs. Explore, present, confirm, then write. A re-run shows a diff against the existing file and keeps the user's own edits.

## Process

### 1. Explore

Read what exists:

- `docs/agents/documentation.md` (prior run), `docs/agents/issue-tracker.md`, `docs/agents/domain.md`
- `AGENTS.md` / `CLAUDE.md`, `GLOSSARY.md`, `docs/adr/`
- existing doc folders (`docs/`, `doc/`, `wiki/`, `README.md`), `CHANGELOG.md`
- the source layout (`src/`, `lib/`, `app/`, ...) to propose code paths
- how a reference could be generated (OpenAPI/Swagger, TypeDoc, DocFX, `dotnet`, `pydoc`, ...)

### 2. Check the dependency

`docs/agents/issue-tracker.md` must exist, because the other skills read Specs only through it. Missing: stop and tell the user to run `setup-matt-pocock-skills` first; tracker instructions come from that skill alone.

### 3. Ask, one question at a time

Lead each question with the recommended answer. Skip a question the exploration already settled.

1. **Code paths**: which folders hold production code? The Stop hook only reacts to changes there.
2. **Audiences**: which of developers, agents, analysts/business, operations, end users apply? Doc types for an unselected audience are left out of the Living Docs table and the Matrix.
3. **Existing docs**: map each Living Doc type to an existing doc folder where the project has one, and to the template default otherwise. `doc-paths` is the union of those locations.
4. **Changelog**: keep Release Notes with Change Fragments? Recommend **on** for anything with released versions. If off, set `changelog: off`; `distill` writes no fragments and `release-notes` refuses to run.
5. **Reference command**: the command that regenerates the Reference from code, or empty.

### 4. Confirm and write

Show the full `documentation.md` and the `AGENTS.md`/`CLAUDE.md` block below. Let the user edit before you write.

Edit whichever of `CLAUDE.md` / `AGENTS.md` exists; if neither does, ask which to create. Add or update a `### Documentation` entry under `## Agent skills`:

```md
### Documentation

Living Docs are kept true as part of every Change. Settings, locations and the Change-to-doc Matrix are in `docs/agents/documentation.md`. Before opening a PR, run `/ship-of-theseus:distill`. To check for Doc Drift at any time, run `/ship-of-theseus:check`.
```

Create only the doc folders for selected audiences; `document` writes the real docs on demand.

### 5. Report

Done when every file written and every item skipped is listed. With `changelog: on`, mention `/ship-of-theseus:release-notes`.
