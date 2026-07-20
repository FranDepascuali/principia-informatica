# Principia Informatica

> Axioms, principles, and hard-won heuristics about building software — the things I hold to be true.

## Preface

In the tradition of the *Principia*: this is not a tutorial, not a style guide, and not a list of trends. It is a set of propositions about software that I have come to hold true through practice.

Each proposition is stated plainly, justified with reasoning or experience, and — crucially — open to revision given evidence. These are strong priors, not immutable laws. The goal is *phronesis*: practical wisdom, not dogma.

If a proposition here conflicts with your experience, that is interesting. Open an issue.

## How to read this

Every proposition lives in its own file under [`propositions/`](./propositions/) and follows the same structure:

- **Proposition** — the rule, stated in one sentence.
- **Rationale** — why I believe it, ideally with a concrete example or scar story.
- **Corollaries** — practical consequences that follow from it.
- **Exceptions** — when it does *not* apply. A rule without known exceptions is either trivial or untested.

Propositions are numbered for easy reference (e.g. "this violates prop. 007"). Numbering implies no hierarchy — only order of writing.

## Index of propositions

| # | Proposition |
|---|-------------|
| 001 | [Code exists to be understood](./propositions/001-code-exists-to-be-understood.md) |
| 002 | [Everything that affects behavior must be explicit](./propositions/002-everything-explicit.md) |
| 003 | [Metaphysical parsimony](./propositions/003-metaphysical-parsimony.md) |

*The index grows as propositions are added.*

## Purpose

This repository has two goals:

1. **Distillation.** Writing a belief down forces it to be precise. Vague intuitions don't survive the format above.
2. **Reuse.** These propositions will eventually be compiled into a skill (`SKILL.md`) that can be applied when writing, reviewing, or designing software.

## Contributing (to myself)

The full editing rules live in [`CLAUDE.md`](./CLAUDE.md#rules-when-editing-this-repo). In short, rules for adding a proposition:

- One proposition per file, following the template in [`propositions/TEMPLATE.md`](./propositions/TEMPLATE.md).
- It must include at least one exception, or an honest admission that none is known yet.
- If confidence drops or a proposition is refuted, it is not deleted — it is amended, with a note. The history of being wrong is part of the record.

## License

MIT — take what is useful, discard the rest.
