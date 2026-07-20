# Proposition 006 — Group helpers by the type they serve

## Proposition
Group helper functions around the type they operate on, never in an unbounded `Utils` or `Helpers` bucket.

## Rationale
"Utils" is a scope with no boundary, so it grows without limit and mixes generic list juggling with domain-specific logic until no one can find anything. Grouping helpers by the type they act on gives every function an obvious home: to find or add a helper for a type, you look in exactly one place. It also keeps the group self-contained and shareable, one unit that depends only on the type it serves rather than tangled up with your domain models. The discipline is in naming the boundary honestly up front instead of deferring every decision to a catch-all.

## Corollaries
- Name a helper group after the single type it serves, and keep all helpers for that type there.
- A helper that reaches into several unrelated domain types belongs to none of them; that is a design smell, not a `Utils` entry.
- Because the group depends only on its type, you can lift it out and reuse it elsewhere as a single unit.
- If you cannot name the type a helper serves, question whether the helper should exist at all.

## Exceptions
- Genuinely cross-cutting glue that belongs to no single type can live in a small, clearly named module (not a catch-all).
- One-off helpers used in a single file can stay local to that file.
