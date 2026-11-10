---
name: distill
description: "Distill a Change into the Living Docs before the PR: update affected docs, write the Change Fragment, offer an ADR."
---

# Distill a Change

Distillation moves the Change's durable knowledge into the Documentation Set, in the working tree, so docs and code reach review in one PR. Leave all changes uncommitted: a human reviews code and docs together.

## 1. Gather

Done when you hold the settings, the Spec (or know there is none) and the full diff.

- Read `docs/agents/documentation.md`. Missing: tell the user to run `/ship-of-theseus:setup` and stop.
- Take the Spec reference from the argument, else the branch name, else recent commit messages, else ask. Fetch it as `docs/agents/issue-tracker.md` describes and state its title. Without a Spec, or with an unusable `issue-tracker.md`, work from the diff and ask the user to paste any Spec text.
- Read the diff: everything not on the default branch, plus uncommitted work.

## 2. Classify

Done when every column of the Change's Matrix row is accounted for: `yes` columns opened; `maybe` columns opened or skipped with a concrete reason from the diff or Spec.

Kinds of Change: feature, bugfix, refactor, infra, dependency/tooling.

## 3. Update the Living Docs

Done when every opened doc matches the code as it is now: each statement the Change made false is removed, each fact it added is present.

Follow [../document/DOC-TYPES.md](../document/DOC-TYPES.md) for the opened type. Write the present state ("the discount applies per order line"), not the story of the Change. Run `reference-command` for generated Reference output instead of hand-editing it. Take terms from `GLOSSARY.md`; for a new or renamed concept, call Skill `domain-modeling`.

## 4. ADR

Done when the decision is tested against all three: hard to reverse, surprising without context, a real trade-off. All three hold: call Skill `domain-modeling` and write the ADR in its format. Otherwise move on without comment.

## 5. Change Fragment

Applies when `changelog: on` and users or operators notice the Change. Write `<fragments-path>/<ticket-or-slug>.md`:

```md
---
category: Added | Changed | Fixed | Removed | Deprecated | Security
---
Technical sentence for developers and operations.

User: One sentence for end users. Omit this line when users notice nothing.
```

## 6. Report

Done when each opened doc is listed with its reason, each skipped `maybe` doc with its reason, and each unverified claim named.
