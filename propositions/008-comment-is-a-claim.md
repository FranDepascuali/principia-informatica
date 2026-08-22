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
