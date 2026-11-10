# agent-plugins

A Claude Code marketplace with plugins for software teams. Domain language is in [GLOSSARY.md](GLOSSARY.md); decisions are in [docs/adr/](docs/adr/).

## Install

```
/plugin marketplace add pietercil/agent-plugins
/plugin install ship-of-theseus@agent-plugins
```

Installing `ship-of-theseus` also enables `mattpocock-skills`, which it depends on ([ADR 0004](docs/adr/0004-hard-dependency-on-mattpocock-skills.md)).

## Plugins

### ship-of-theseus

Keeps a project's documentation true while its code changes. Run `/ship-of-theseus:setup` once per project, then:

| Skill | Use it to |
| --- | --- |
| `setup` | Configure code paths, audiences, changelog on/off and reference command. Re-runnable. |
| `distill` | Move the durable knowledge of a Change into the Living Docs before opening the PR. |
| `document` | Write or refresh one doc type for one scope, e.g. for an existing project. |
| `check` | Report Doc Drift, read-only. |
| `release-notes` | Merge Change Fragments into `CHANGELOG.md` and the end-user release notes. |

A Stop hook asks Claude to run `check` once when production code changed without any doc change. It needs `docs/agents/documentation.md`, so it stays silent in projects that have not run `setup`.

## Develop

```
claude plugin validate .
bash tests/doc-drift-hook.test.sh
```
