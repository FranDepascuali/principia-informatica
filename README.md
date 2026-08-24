# Principia Informatica

> Axioms, principles, and hard-won heuristics about building software: the things I hold to be true.

## Preface

A set of propositions about software I have come to hold true through experience. Each is stated plainly, justified, and open to revision. Strong priors, not immutable laws. The goal is *phronesis*: practical wisdom, not dogma.

If a proposition conflicts with your experience, that is interesting. Open an issue.

## On the use of AI

This work is written with AI, using the same tools I use as a software engineer. The beliefs, the arguments, and the philosophical stakes are mine.

## How to read this

Each proposition lives in its own file under [`propositions/`](./propositions/), with four sections:

- **Proposition**: the rule, in one sentence.
- **Rationale**: why I believe it.
- **Corollaries**: practical consequences.
- **Exceptions**: when it does *not* apply.

Numbering is for reference only (e.g. "this violates prop. 007"), not hierarchy.

## Index

| # | Proposition |
|---|-------------|
| 001 | [Code exists to be understood](./propositions/001-code-exists-to-be-understood.md) |
| 002 | [Everything that affects behavior must be explicit](./propositions/002-everything-explicit.md) |
| 003 | [Metaphysical parsimony](./propositions/003-metaphysical-parsimony.md) |
| 004 | [Build without classes](./propositions/004-build-without-classes.md) |
| 005 | [Data is plain and serializable](./propositions/005-data-is-plain-and-serializable.md) |
| 006 | [Group helpers by the type they serve](./propositions/006-group-helpers-by-type.md) |
| 007 | [Escape the law of the instrument](./propositions/007-escape-the-law-of-the-instrument.md) |
| 008 | [A comment is a claim about the world](./propositions/008-comment-is-a-claim.md) |

## Purpose

1. **Distillation.** Writing a belief down forces it to be precise.
2. **Reuse.** The propositions compile into an installable [skill](./skills/principia-informatica/) that applies them when writing, reviewing, or designing software.

## Installing the skill

Preferred: the [Agent Skills](https://agentskills.io) standard, via the [`skills`](https://github.com/vercel-labs/skills) CLI. One command, no clone required:

```bash
npx skills add FranDepascuali/principia-informatica
```

This installs into the current repo (`.claude/skills/`). Add `-g` to install it globally (`~/.claude/skills/`), available in all your projects:

```bash
npx skills add FranDepascuali/principia-informatica -g
```

The same command works across Claude Code, Cursor, Codex, Copilot, Gemini CLI, and other skills-compatible tools. It loads automatically when a task matches its description, or invoke it manually with `/principia-informatica`.

## Updating an installed copy

An installed skill is a copy. To pull the latest propositions:

```bash
npx skills update principia-informatica
```

Add `-g` for a global install, or run `npx skills update` with no arguments to update every installed skill. `npx skills list` shows what you have and where.

## Regenerating the bundle (author)

`references/propositions.md` inside the skill is a generated file; the source of truth is [`propositions/`](./propositions/). After adding or amending a proposition, rebuild it from the repo root:

```bash
scripts/build-skill-reference.sh
```

A tracked pre-commit hook runs the rebuild automatically; enable it once per clone with `git config core.hooksPath .githooks`.

## Contributing (to myself)

Full rules in [`CLAUDE.md`](./CLAUDE.md#rules-when-editing-this-repo). In short:

- One proposition per file, using [`propositions/TEMPLATE.md`](./propositions/TEMPLATE.md).
- At least one exception, or an honest note that none is known yet.
- Never delete a proposition; if it is refuted, amend it in place with a dated note.

## License

MIT. Take what is useful, discard the rest.
