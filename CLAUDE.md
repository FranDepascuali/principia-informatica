# CLAUDE.md

## What this repository is

`principia-informatica` is a personal collection of software engineering propositions — axioms and heuristics the author holds true, distilled from practice. It is **prose, not code**. There is nothing to build, run, or test.

The long-term goal is to compile these propositions into a `SKILL.md` that can be applied when writing, reviewing, or designing software.

## Structure

```
principia-informatica/
├── README.md            # preface + index of all propositions
├── CLAUDE.md            # this file
└── propositions/
    ├── 001-boring-technology.md
    └── ...
```

## Proposition format

Every file in `propositions/` follows this exact structure, with these four sections and no others:

```markdown
# Proposition NNN — Short title

## Proposition
The rule, stated in ONE sentence. Imperative or declarative.

## Rationale
Why the author believes it. Concrete examples or scar stories preferred over abstract argument.

## Corollaries
Practical, actionable consequences that follow from the proposition.

## Exceptions
When it does NOT apply. Every proposition must have at least one exception,
or an honest admission that none is known yet.
```

## Rules when editing this repo

1. **One proposition per file.** Filename format: `NNN-kebab-case-title.md`, where `NNN` is zero-padded and sequential. Never renumber existing propositions.
2. **Keep the four-section format exactly.** Do not add sections (no Confidence, no References, no See Also) unless the author explicitly asks.
3. **Update the index and rebuild the skill.** Any time a proposition is added, renamed, or amended, update the table in `README.md` to match, and regenerate the skill bundle by running `scripts/build-skill-reference.sh`. The source of truth is `propositions/`; `skills/principia-informatica/references/propositions.md` is a generated artifact, never edited by hand. A tracked pre-commit hook runs the rebuild automatically; enable it once per clone with `git config core.hooksPath .githooks`.
4. **Never delete a proposition.** If one is refuted or weakened, amend it in place and add a dated note explaining what changed and why. The history of being wrong is part of the record.
5. **Voice:** first person, direct, concise. These are the author's beliefs, not neutral documentation. Prefer "I" statements in rationales. No hedging filler ("it could be argued that...").
6. **A concrete example is optional, never fabricated.** A scar story sharpens a Rationale, but reasoned argument alone is a complete Rationale. Do not force one where none exists, and never invent one. If the author explicitly wants to flag that an example is still wanted, use a `<!-- TODO: concrete example -->` placeholder; otherwise leave the Rationale as it stands.

## When drafting a new proposition with the author

- Ask for the underlying experience first; the rule should be distilled *from* it.
- Insist on at least one exception. If none surfaces, note that explicitly.
- Keep the Proposition line to one sentence, even if it takes several iterations.

## Style

- Markdown, English, sentence case for headings.
- No emojis.
- Keep files short; a proposition that needs 200 lines is probably two propositions.
