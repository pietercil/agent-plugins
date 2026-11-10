# The plugin is issue-tracker agnostic and only follows docs/agents/issue-tracker.md

Our skills never call `gh` or any other tracker CLI directly. They read a Spec through the instructions in the project's `docs/agents/issue-tracker.md`, and leave creating the PR to the team's own flow. Teams here use GitHub in some projects and Azure DevOps in others, and the plugin has to behave the same in both. Hardcoding GitHub would have been simpler, but it would have made the plugin unusable for a large share of its intended users.

## Consequences

If `issue-tracker.md` is missing, `setup` points to `setup-matt-pocock-skills`, and `distill` asks the user to paste or describe the Spec instead of failing.
