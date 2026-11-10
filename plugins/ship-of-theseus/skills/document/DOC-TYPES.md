# Writing each Living Doc type

Every Living Doc describes the system as it is now, for the reader named below, in the terms of `GLOSSARY.md` (English, with the Dutch business term beside it where the glossary has one).

- **Functional Description** (analysts, business): per capability, what the system does: rules, flows, exceptions, in business language.
- **Architecture Overview** (developers, agents): contexts, modules, integrations, data flows. Mermaid diagrams at C4 level 1-2. State boundaries and ownership; link ADRs for why.
- **Reference** (developers, integrators): exact facts: API endpoints, configuration keys with defaults, data model. Generated from code wherever possible; otherwise a flat table per area.
- **Runbook** (operations, support): task-first: deploy, monitor, troubleshoot (symptom, cause, fix), roll back. Every step is a command or click path someone can follow at 3 a.m.
- **User Guide** (end users): "How do I ..." from the user's point of view, in the user's words.
- **Onboarding Guide** (new developers): clone to first green test, then a short tour of the codebase pointing at the other docs.
- **Agent Docs** (agents): conventions and pointers: how to build and test, where docs live. Link rather than copy.
- **Release Notes**: written by `release-notes` from Change Fragments.
