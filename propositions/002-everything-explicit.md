# Proposition 002 — Everything that affects behavior must be explicit

## Proposition
Everything that affects a program's behavior must be explicit and visible: no hidden connections, no invisible side effects, no implicit state, with every function declaring all of its dependencies through its parameters.

## Rationale
This follows directly from prop. 001: you cannot understand what you cannot see. Hidden inputs are the main reason a function that "looks right" behaves wrong: a global read here, an ambient singleton there, a side effect three layers down. When dependencies are explicit parameters, a function's signature is a truthful contract that tells you everything capable of changing its result. When they are implicit, the signature lies, and understanding the function requires reading the whole call graph behind it.

## Corollaries
- Pass dependencies in; do not reach out for them. Prefer arguments over globals, singletons, and ambient context.
- Make side effects obvious at the call site, not buried inside an innocuous-looking accessor.
- Prefer pure functions where practical, and isolate the impure edges of the system.
- If you cannot tell what a function depends on from its signature, the signature is incomplete.
- Dependency injection containers are usually overengineering: they hide the very wiring they claim to manage. Pass dependencies explicitly as arguments instead of resolving them from a container.

## Exceptions
None known yet. I have not found a case where letting something affect behavior invisibly is worth the loss of understanding.
