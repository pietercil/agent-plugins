# Claude proposes doc updates in the same PR; it never commits them unreviewed

"Automatic" documentation means Claude writes the Living Doc changes alongside the code change, in the same PR, and a human approves both in one review. Claude never commits doc changes without review. Unreviewed agent edits pile up as plausible-looking but wrong documentation, and flagging Doc Drift without writing the fix leaves the docs not updated in practice.

## Consequences

There is no CI drift check. Doc Drift is caught at authoring time, by skills that run during the work and hooks that nudge at the end of a turn, and at PR review time by the reviewer.
