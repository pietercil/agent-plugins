# The plugin hard-depends on mattpocock-skills, tracking its latest version from upstream

`ship-of-theseus` declares `mattpocock-skills` as a dependency in `plugin.json`. Our marketplace lists that plugin directly from its original repository (`mattpocock/skills`) with no pinned `ref`, so teams always get the latest version. Glossary and ADR conventions, the issue-tracker config and the Spec flow all come from `mattpocock-skills`, and our skills build on them instead of duplicating them. We accept that an upstream change can break us in exchange for always getting the newest skills without a bump on our side.

## Considered Options

- **Pin to a tag and bump deliberately**: rejected. We prefer the latest version over upstream-change protection. Revisit if an upstream change breaks `ship-of-theseus`.
- **Own the Glossary and ADR conventions in our plugin**: rejected. It duplicates conventions that are already maintained upstream and would drift from them.
- **Soft dependency (skills work without it)**: rejected. It needs a second code path that every team using the plugin would have to trust and nobody would exercise.
