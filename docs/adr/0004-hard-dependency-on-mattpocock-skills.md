# The plugin hard-depends on mattpocock-skills, pinned to a tag and sourced from upstream

`ship-of-theseus` declares `mattpocock-skills` as a dependency in `plugin.json`. Our marketplace lists that plugin directly from its original repository (`mattpocock/skills`) at a fixed tag, which we bump deliberately. Glossary and ADR conventions, the issue-tracker config and the Spec flow all come from `mattpocock-skills`, and our skills build on them instead of duplicating them. The cost is that an upstream change can break us, which is why the version is pinned rather than floating.

## Considered Options

- **Own the Glossary and ADR conventions in our plugin**: rejected. It duplicates conventions that are already maintained upstream and would drift from them.
- **Soft dependency (skills work without it)**: rejected. It needs a second code path that every team using the plugin would have to trust and nobody would exercise.
