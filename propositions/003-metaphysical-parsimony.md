# Proposition 003 — Metaphysical parsimony

## Proposition
Do not multiply computational entities beyond necessity: every abstraction, layer, and indirection must justify itself by making the system easier to understand, never by appeal to orthodoxy.

## Rationale
Occam's razor for software. Entities are not free: each abstraction, layer, and indirection is one more thing a reader must learn, hold in their head, and step through to follow behavior. I have seen far more systems drowned by premature or dogmatic abstraction ("this must have an interface", "everything is an object", "add a service layer") than by too little of it. An abstraction pays rent only when it removes more cognitive load than it adds. Most speculative ones never do: they add indirection today to buy flexibility that is never used.

## Corollaries
- Justify each abstraction by the understanding or reuse it actually buys today, not by a principle whose name you can cite.
- When two designs are otherwise comparable, prefer the one with fewer moving parts.
- Inline an indirection that only forwards. A wrapper that adds nothing but a hop is a liability.
- "We might need it later" is not a justification. Add the layer when "later" actually arrives.
- Duplication is cheaper than the wrong abstraction; wait until the shape is clear before extracting it.

## Exceptions
- Abstractions that hide genuine, stable complexity behind a simple interface (a database driver, a well-drawn module boundary) earn their place. Parsimony targets unjustified entities, not all of them.
- Boundaries required for testing, security, or a real seam against an external system are justified even when they look like "extra" indirection.
- Some regulated or safety-critical contexts mandate layers (audit, isolation) for reasons that sit outside pure comprehension.
