---
name: release-notes
description: "Compile Change Fragments into CHANGELOG.md and end-user release notes, with a proposed version."
disable-model-invocation: true
---

# Compile release notes

Runs when `changelog: on` in `docs/agents/documentation.md`. With `off` or a missing file, say so and stop. A human tags and publishes the release.

## Process

1. Read every Change Fragment in `fragments-path`. None: say so and stop.
2. Propose the next SemVer version from the latest heading in `changelog-path`: `Removed` or a breaking change gives major, `Added` gives minor, otherwise patch. Done when the user has confirmed the number and release date.
3. Prepend `## [version] - date` to `changelog-path` (Keep a Changelog), grouped by category, from each fragment's technical sentence. Create the file with a short header if it does not exist.
4. Prepend the same version to `user-release-notes-path`, from the `User:` lines only, grouped by category. No `User:` lines: skip this file.
5. Delete the merged fragments.
6. Show the diff and leave it uncommitted. Done when every fragment is either merged and deleted or reported as unmergeable with its reason.
