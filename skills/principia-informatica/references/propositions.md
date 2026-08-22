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

# Proposition 004 — Build without classes

## Proposition
Build systems out of functions and plain data types, and do not create classes of your own.

## Rationale
A class bundles three things at once (state, behavior, and identity) and forces all three on you even when the problem needs only one. Most of what we model is just data and transformations over it, which functions and plain types express directly. A method is only a function with an implicit, unconstrained first argument, `this`: its signature tells you nothing about what it may touch, so it can quietly read or mutate the whole instance. A free function's signature is the opposite, a fixed contract that bounds exactly what it can see and change (this is prop. 002 applied to behavior). Over many codebases I have never seen anyone regret reaching for a function; I have repeatedly seen classes, inheritance, and "everything is an object" breed the abstractions and bugs prop. 003 warns about. Starting from functions and types also deletes a whole vocabulary you would otherwise have to carry: inheritance, dispatch, overriding, DI containers, DTOs, DAOs.

## Corollaries
- Turn every method into a free function that takes its data as the first parameter; the signature then bounds what it can touch.
- Represent entities as interfaces or records, and their behavior as functions over them.
- Prefer composing functions to inheriting from base classes; there is no hierarchy to trace and no dispatch to reason about.
- With data passed in as parameters, you never need a dependency injection container to wire objects together (see prop. 002).
- When a platform forces a class on you, keep it a thin shell and put the real logic in functions.

## Exceptions
- The platform leaves no choice: custom error types must extend `Error`, and some frameworks or libraries require you to subclass or instantiate their base classes. Use the class, keep it thin, and push the logic into functions.
- Interop with an external, class-based API you do not control.


---

# Proposition 005 — Data is plain and serializable

## Proposition
Model data as plain, serializable structures; a value that cannot survive a JSON round-trip is carrying machinery that does not belong in the data.

## Rationale
Data should be transparent: what you see is what it is (props. 001 and 002). A plain interface or record serializes, deserializes, diffs, logs, and crosses a wire or a process boundary for free. A class instance does none of this without help: to serialize one you reach for hacks or a library like class-transformer, because the instance hides methods, a prototype, and private state behind its fields. That friction is a signal, not an inconvenience. If a value needs special machinery to become bytes, it was never plain data; it was behavior and identity wearing a data costume.

## Corollaries
- Describe data with interfaces, types, or records, never classes (see prop. 004).
- Keep behavior out of the value and in functions that take it.
- Wanting to attach methods to a value is evidence the value is not plain data; separate the two.
- Prefer shapes that round-trip through JSON so persistence, transport, and logging stay trivial.

## Exceptions
- A value that genuinely wraps a live, non-serializable resource (a file handle, a socket, an open database connection) is not plain data and should not pretend to be. Treat it as an opaque reference that you pass into functions, not as an object with methods and behavior of its own (see prop. 004).
- Opaque handles or tokens where hiding the interior is the entire point.


---

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


---

# Proposition 007 — Escape the law of the instrument

## Proposition
Deliberately work in languages and paradigms outside your default, so you stop reducing every problem to the one tool you already know.

## Rationale
Give a small boy a hammer and he finds that everything needs pounding (Kaplan). Your default language quietly shapes which solutions you can even see: if you only know objects, every problem looks like a class hierarchy. Breadth is what lets you notice that a convention from one language solves a problem your language has no feature for. The point is not to abandon your main tool but to gain the distance to judge it.

## Corollaries
- Treat the discomfort of an unfamiliar paradigm as information about your default's blind spots, not as proof the new tool is wrong.
- When your language lacks a good idea from another, port it by convention rather than waiting for the feature.
- Choose a tool by its fit to the problem, not by how familiar it is.

## Exceptions
- Under a hard deadline on a mature stack, breadth-seeking is a background habit, not an in-the-moment tactic.
- Depth still compounds: broad exposure complements deep mastery of one tool, it does not replace it.


---

# Proposition 008 — A comment is a claim about the world

## Proposition
Aim a comment at a fact about the world rather than at the lines below it, so that it stays true through a rewrite of those lines.

## Rationale
A comment is a claim about something, and its fate depends on what it is a claim about.

The author perceives a problem together with the facts that constrain it: what the domain requires, what the platform forbids, what a measurement showed, what was tried and abandoned. From those facts they reason to a solution, and commit the solution to a formal language. That language is built to carry conclusions and has nowhere to put premises. The machine needs no reasons, only instructions, and so the reasons are dropped at the moment of writing.

What is dropped cannot be recovered, because the encoding cannot be inverted. The code shows what was decided and is silent on what decided it. The conclusion a reader recovers perfectly, simply by reading it; the premises they can only guess at, and a plausible guess is indistinguishable from the truth. A comment exists to restore the premises the code could not hold. Most code loses no premise, and wants no comment.

A comment aimed at a premise survives any rewrite that preserves the conclusion, for the premise was never about the lines. A comment aimed at the conclusion is falsified by the next edit.

Nothing will report that falsification. The compiler, the tests and the runtime execute the code and never read the comment. Whoever does read it reads to learn rather than to verify: to them the prose is evidence, not a hypothesis. So the only audience able to catch a lying comment is the audience it lies to, and it catches it only after having believed it. Stale prose is worse than none: it carries an authority it has not earned, and sends the reader looking in the wrong place.

## Corollaries
- Comment only where there is a premise to record. Most code has none behind it and wants no comment: a header on every function and a note on every field bury the few comments that matter.
- Try first to make the comment unnecessary: a better name, an extracted function, an earlier return. Reach for prose only when the code has run out of room. (See prop. 001 and 002.)
- Test a comment before writing it: if the code beneath it were rewritten from scratch, would the comment still be true? If not, it is aimed at the implementation, and should be deleted or re-aimed at the premise behind it.
- Prefer premises that are external and unguessable: an incident, a ticket, a spec section, a vendor bug, a benchmark result.
- Clarity is a comment's first virtue and brevity its second. A comment is the only record of its premise, so a sentence the reader must decipher has already failed; shorten it only as far as precision allows.
- Keep a comment adjacent to its subject: above the statement it concerns, or above the declaration of the function, type or field it concerns. An orphaned comment is stale by construction.
- Treat comment churn as a review signal. "This comment restates the line below it" is a legitimate review objection.
- Treat a stale comment as a bug and fix or delete it on sight; unlike dead code, no tooling will catch it.

## Exceptions
- Public API documentation legitimately restates *what*, because its reader has the signature and not the body. A docstring is a contract for callers, not an explanation for maintainers.
- Irreducibly complex code (numerics, cryptography, parsers, hot loops) may need a *what*-level walkthrough, because it genuinely cannot carry its own meaning. Same carve-out as prop. 001.
- Ceremonial and machine-directed comments (license headers, lint suppressions, codegen markers) are not explanation and are out of scope, though the justification attached to a suppression is a *why* and should be a real one.
- Teaching code, whose reader is a learner rather than a maintainer, may narrate *what* on purpose.


---

