---
name: principia-informatica
description: Apply Principia Informatica, a curated set of software engineering propositions (axioms and hard-won heuristics distilled from practice), when writing, reviewing, or designing software. Use when making a technical design decision, choosing a technology or dependency, reviewing code or a pull request, weighing an engineering trade-off, or sanity-checking an architecture: test the work against these first-principles rules and cite the relevant proposition numbers. Each proposition carries a rationale, corollaries, and explicit exceptions, so apply them as strong priors, not dogma.
license: MIT
---

# Principia Informatica

A curated set of software engineering propositions: rules the author holds true, each distilled from practice. Use them as strong priors when building, reviewing, or designing software. They are falsifiable beliefs, not laws, and every one lists the cases where it does not apply.

## When to use this skill

Reach for these propositions when:

- Designing a system or choosing an approach, to pressure-test the design.
- Choosing a technology, framework, or dependency.
- Reviewing code or a pull request, to ground feedback in a stated principle.
- Weighing a trade-off (speed vs. simplicity, abstraction vs. duplication, and so on).
- Someone asks "is this a good idea?" about a technical decision.

## How to apply them

1. Read `references/propositions.md` for the full set. Each entry has four parts: Proposition (the one-sentence rule), Rationale (why), Corollaries (what follows in practice), and Exceptions (when it does not hold).
2. Match the situation to the relevant proposition(s). Cite the specific one by number, e.g. "This looks like it violates prop. 001 (boring technology)."
3. State the rule, then the rationale, then check the Exceptions before concluding. Do not apply a proposition whose exception fits the situation in front of you.
4. Treat these as priors, not proofs. If the user's context genuinely contradicts a proposition, say so plainly. A real counter-case is more interesting than forced compliance.
5. When reviewing, phrase feedback as "prop. NNN suggests X, because Y" so it is traceable and arguable.

## Rules

- Cite proposition numbers when you invoke them, so the advice is traceable.
- Always respect the Exceptions section. A proposition applied where its exception holds is misapplied.
- Never fabricate a proposition. If none covers the situation, say so; do not invent a number or a rule.
- Keep the author's voice: these are opinionated priors, stated directly, no hedging filler.

## Index

The current, complete set lives in `references/propositions.md`. The same index is mirrored in the project `README.md`.
