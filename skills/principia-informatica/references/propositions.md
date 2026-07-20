# Propositions (compiled)

Generated from propositions/[0-9]*.md by scripts/build-skill-reference.sh.
Do not edit by hand: edit the source proposition and regenerate.

# Proposition 001 — Code exists to be understood

## Proposition
Code exists to be understood, not merely executed; a program that works but that no one can understand is an epistemological failure, even when it meets every functional requirement.

## Rationale
Esse est percipi et intelligi: to be is to be perceived and understood. Source code has two audiences, the machine and the human, and only the machine cares whether it merely runs. Everything expensive about software over its lifetime (changing it, debugging it, trusting it, handing it to someone else) is gated on a human understanding it first. Code that executes correctly but resists understanding has not avoided its cost, only deferred it: the bill arrives at the first change request, the first incident at 3am, the first new hire.

## Corollaries
- Optimize code for the reader, not the writer. Comprehension is the scarce resource, not keystrokes.
- "It works" is a necessary condition, not a sufficient one. Review should be willing to reject correct code that cannot be understood.
- Prefer names, structure, and control flow a stranger could follow over cleverness only the author can decode.
- If explaining a piece of code takes longer than rewriting it clearly, rewrite it.

## Exceptions
- Genuinely irreducible complexity: some domains (numerics, cryptography, performance-critical kernels) contain code that is inherently hard to follow. Here the duty shifts to making the surrounding context, invariants, and references understandable, even when the core cannot be simplified.
- Throwaway code with a truly short life (a one-off migration, a spike) may not be worth the investment, provided it really does die quickly.


---

# Proposition 002 — Everything that affects behavior must be explicit

## Proposition
Everything that affects a program's behavior must be explicit and visible: no hidden connections, no invisible side effects, no implicit state, with every function declaring all of its dependencies through its parameters.

## Rationale
This follows directly from prop. 001: you cannot understand what you cannot see. Hidden inputs are the main reason a function that "looks right" behaves wrong: a global read here, an ambient singleton there, a side effect three layers down. When dependencies are explicit parameters, a function's signature is a truthful contract that tells you everything capable of changing its result. When they are implicit, the signature lies, and understanding the function requires reading the whole call graph behind it.

Explicitness also eliminates a whole class of threading bugs. Data races feed on hidden shared mutable state: globals, ambient singletons, implicit caches touched from more than one thread. Code that passes its dependencies in and keeps state out of the shadows has far less to race over, so concurrency bugs that would otherwise be invisible simply cannot arise.

## Corollaries
- Pass dependencies in; do not reach out for them. Prefer arguments over globals, singletons, and ambient context.
- Make side effects obvious at the call site, not buried inside an innocuous-looking accessor.
- Prefer pure functions where practical, and isolate the impure edges of the system.
- If you cannot tell what a function depends on from its signature, the signature is incomplete.
- Dependency injection containers are usually overengineering: they hide the very wiring they claim to manage. Pass dependencies explicitly as arguments instead of resolving them from a container.

## Exceptions
None known yet. I have not found a case where letting something affect behavior invisibly is worth the loss of understanding.


---

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


---

