# Proposition 008 — Comments explain why, never what

## Proposition
Aim a comment at a fact about the world rather than at the lines below it, so that it stays true through a rewrite of those lines.

## Rationale
Good comments are changed sporadically, and that is not an accident of good writing: it follows from what they point at. A comment is stable exactly when it points at something outside the code, a constraint the world imposes, a decision taken once, a property of the domain, an alternative already tried and discarded. None of those move when the implementation moves, because none of them were ever about the implementation. A comment that describes what the code does is pinned to those exact lines, so every edit to them obligates an edit to the prose.

That obligation is the problem, because nothing enforces it. The compiler, the tests, and the reader all check the code; nothing checks the sentence above it. A comment that must change constantly is therefore a comment that will eventually not change, and the failure is worse than silence: stale prose is trusted precisely because it looks authoritative, and it sends the reader looking in the wrong place. Frequency of required change is the diagnostic. A comment you keep having to touch was never carrying knowledge; it was carrying a copy of the code, and copies drift.

Facts about the world are also the only thing worth the risk, because they are the only thing unrecoverable. Everything the implementation does can be learned by reading the implementation, which is what it is for; a comment restating it competes with a source that cannot be wrong. What surrounds the code has no such source. The constraint that forced an awkward shape, the option that looks obvious and was already tried, the reason an order of operations matters: that knowledge lives in the author's head, and if it is not written down it is lost the moment they move on. The next person sees a strange-looking line, finds nothing defending it, and "simplifies" it back into the bug it was written to prevent.

## Corollaries
- Test a comment before writing it: if the code beneath it were rewritten from scratch, would the comment still be true? If not, it is aimed at the implementation and should be deleted or re-aimed at the fact behind it.
- Treat comment churn as a review signal. A diff that edits prose alongside every logic change is evidence the prose was pinned to the logic; a comment nobody has needed to touch in years is usually one of the good ones, not a stale one.
- Before writing a comment, try to make it unnecessary: a better name, an extracted function, an earlier return. Reach for the comment when the code has genuinely run out of room. (See prop. 001 and 002.)
- Prefer comments that reference something external and unguessable: a domain decision, a ticket, an incident, a spec section, a vendor bug, a benchmark result.
- Treat a stale comment as a bug and delete or correct it on sight; unlike dead code, it cannot be caught by tooling.
- Review comments as strictly as code. "This comment restates the line below it" is a legitimate review objection.
- If the *why* spans several files or outlives the code, it belongs in a commit message, an ADR, or a design doc, with the comment reduced to a pointer.

## Exceptions
- Public API documentation legitimately restates *what*, because its reader is looking at the signature, not the body. Docstrings are a contract for callers, not an explanation for maintainers.
- Irreducibly complex code (numerics, cryptography, parsers, hot loops) may need a *what*-level walkthrough, because the code genuinely cannot carry its own meaning. This is the same carve-out as prop. 001.
- Ceremonial and machine-directed comments (license headers, lint suppressions, type-checker escapes, codegen markers) are not explanation and are not covered by this rule, though the justification attached to a suppression is a *why* and should be a real one.
- Teaching code, where the reader is a learner rather than a maintainer, is written to be read line by line and may narrate *what* on purpose.
