# Principia Informatica

> Axioms, principles, and hard-won heuristics about building software: the things I hold to be true.

## Preface

In the tradition of the *Principia*: not a tutorial, not a style guide, not a list of trends. A set of propositions about software I have come to hold true through practice. Each is stated plainly, justified, and open to revision. Strong priors, not immutable laws. The goal is *phronesis*: practical wisdom, not dogma.

If a proposition conflicts with your experience, that is interesting. Open an issue.

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

## Purpose

1. **Distillation.** Writing a belief down forces it to be precise.
2. **Reuse.** The propositions compile into an installable [skill](./skills/principia-informatica/) that applies them when writing, reviewing, or designing software.

## Installing the skill

The skill is a single portable folder that follows the [Agent Skills](https://agentskills.io) standard. Full per-tool instructions are in [`skills/principia-informatica/INSTALL.md`](./skills/principia-informatica/INSTALL.md). The quick path for Claude Code, from the repo root:

```bash
# Personal (available in all your projects)
cp -r "$(pwd)/skills/principia-informatica" ~/.claude/skills/principia-informatica

# Project-scoped (only this repo)
mkdir -p .claude/skills && cp -r "$(pwd)/skills/principia-informatica" .claude/skills/principia-informatica
```

It loads automatically when a task matches its description, or invoke it manually with `/principia-informatica`.

## Updating the skill

`references/propositions.md` inside the skill is a generated bundle; the source of truth is [`propositions/`](./propositions/). After adding or amending a proposition, regenerate it from the repo root and re-copy the folder to wherever it is installed:

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
