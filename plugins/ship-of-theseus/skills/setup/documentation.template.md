# Documentation

How the `ship-of-theseus` skills and hook keep this project's Documentation Set true. Edit freely; re-running `/ship-of-theseus:setup` shows a diff before changing anything and never overwrites your edits silently.

## Settings

One `key: value` per line. The Stop hook reads these lines, so keep the format.

- code-paths: {{code-paths}}
- doc-paths: {{doc-paths}}
- audiences: {{audiences}}
- changelog: {{changelog}}
- fragments-path: docs/changes/unreleased/
- changelog-path: CHANGELOG.md
- user-release-notes-path: docs/user/release-notes.md
- reference-command: {{reference-command}}

## Living Docs

| Type | Audience | Location |
| --- | --- | --- |
| Functional Description | analysts, business | docs/functional/ |
| Architecture Overview | developers, agents | docs/architecture/ |
| Reference | developers, integrators | docs/reference/ |
| Runbook | operations, support | docs/runbooks/ |
| User Guide | end users | docs/user/ |
| Onboarding Guide | new developers | docs/onboarding.md |
| Agent Docs | agents | AGENTS.md / CLAUDE.md |

The Glossary and ADRs follow `docs/agents/domain.md`. Release Notes follow the Settings above.

## Matrix

Which kind of Change touches which doc. `yes` means always check; `maybe` means only when relevant; `-` means leave alone.

| Change | Functional | Architecture | Reference | Runbook | User Guide | Release Notes | Agent Docs | Onboarding |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Feature | yes | maybe | yes | maybe | yes | yes | maybe | - |
| Bugfix | maybe (a rule changes) | - | maybe | maybe (troubleshooting) | maybe | yes | - | - |
| Refactor | - | yes | maybe | - | - | - | maybe | maybe |
| Infra / deploy | - | maybe | maybe (config) | yes | - | maybe | maybe | yes |
| Dependency / tooling | - | - | - | maybe | - | maybe | yes | yes |
