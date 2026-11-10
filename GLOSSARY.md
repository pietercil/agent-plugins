# Agent Plugins

A marketplace of Claude Code plugins that teams install into their software projects. One of those plugins keeps a project's documentation up to date as part of analysis, implementation, maintenance and extension work.

## Language

### Distribution

**Marketplace**:
This repository: the catalogue from which projects install plugins.
_Avoid_: Registry, store

**Plugin**:
A single installable unit in the Marketplace, bundling skills, hooks and agents around one concern.
_Avoid_: Extension, package

### Documentation

**Documentation Set** (NL: documentatiepakket):
All documentation of one software project, made up of Living Docs, Specs and ADRs.
_Avoid_: Docs package, wiki

**Living Doc**:
A document that describes the current state of the system and is always kept true.
_Avoid_: Reference doc, static doc

**Change**:
One unit of work on a software project (feature, bugfix, refactor, infra or dependency work), moving through Spec (optional), implementation, Distillation and release. The kind of Change decides which Living Docs it touches.
_Avoid_: Analysis, maintenance, extension, task

**Spec** (NL: analyse):
A description of an intended Change, such as a ticket or PRD in the project's issue tracker, that is closed after implementation and never updated again.
_Avoid_: Requirement doc, analysis doc, GitHub issue, work item

**ADR**:
An immutable record of one hard-to-reverse decision and why it was made; superseded by a newer ADR, never edited.
_Avoid_: Design doc, decision log

**Distillation**:
Moving the durable knowledge out of a Spec into the Living Docs (and, where a real trade-off was made, into a new ADR) when that Spec is closed.
_Avoid_: Sync, migration, write-back

**Doc Drift**:
A mismatch between the code and the Living Docs that describe it.
_Avoid_: Stale docs, outdated docs

### Living Doc types

**Glossary**:
The project's domain language, each term with its Dutch business equivalent.
_Avoid_: Dictionary, terminology list

**Functional Description**:
What the system currently does per capability, including its rules, flows and exceptions, written for analysts and business.
_Avoid_: Functional analysis, spec

**Architecture Overview**:
The system's contexts, modules, integrations and data flows.
_Avoid_: Technical design, design doc

**Reference**:
Exact facts about APIs, configuration and data model, generated from the code wherever possible.
_Avoid_: API docs, technical docs

**Runbook**:
Instructions for deploying, monitoring, troubleshooting and rolling back the system.
_Avoid_: Ops manual, playbook

**User Guide**:
Task-oriented help written from the end user's point of view.
_Avoid_: Manual, help docs

**Release Notes**:
The append-only record of what changed per release, in a technical and an end-user variant.
_Avoid_: Changelog, what's new

**Change Fragment**:
A small file, written in the same PR as a Change, holding that Change's Release Notes entry (category, technical sentence, optional end-user sentence) until the next release merges it into the Release Notes.
_Avoid_: Changelog entry, news item

**Agent Docs**:
The `AGENTS.md`/`CLAUDE.md` files that give AI agents the project's conventions and point them to the rest of the Documentation Set.
_Avoid_: Prompt files, instructions

**Onboarding Guide**:
How a new developer sets up the project locally and finds their way around the codebase.
_Avoid_: Getting started, README
