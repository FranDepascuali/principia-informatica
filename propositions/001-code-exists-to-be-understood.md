# Proposition 001 — Code exists to be understood

## Proposition
Code exists to be understood, not merely executed: it is a description of the world whose truth no machine can check, so a program no reader can read back into the facts has failed even where it runs correctly.

## Rationale
The world comes as facts, and those facts are encoded into a formal language. What results is never the facts but a description of them. Facts hold only of the world as it stands, and lapse when it changes: outside a narrow class of necessary truths, the synthetic a priori Kant was after, everything a domain contributes is contingent. The description, meanwhile, stays exactly as written, and can turn false without a character of it changing.

The facts reach us only through perception, so what anyone holds is never the world but what they managed to sense of it. What arrives is already sorted by the concepts brought to it, and the domain is never met raw: what counts as one entity, one event, one state is imposed in order to have anything to see, not found lying about in the world. The point of the first Critique, unusually literal here, since these categories are written down and shipped: the vocabulary fixes what can be observed, and a fact for which no one holds a concept does not register as a fact.

The description is a chain of characters in a file. Nothing in the marks reaches beyond itself, and the machine manipulates form, never reference; what the text is about is supplied by a reader and by nobody else.

Two questions can be asked of the text: whether what it says is true of the facts, and whether it says what its author meant. Haskell's distinction reaches the second and not the first. An operational semantics says what the machine does with the marks, which reduction fires and at what cost; a denotational semantics says what the text means, independently of how it is evaluated. Running the program settles the operational question whether or not anyone asks. A denotation is chosen by a person, and recovering it from the text is what reading is. Neither semantics reaches the relation between a denotation and the facts: there is no semantics of adequacy to the world.

The compiler, the types and the tests check the text against a specification, and a specification is another description by the same hand: it can pin a denotation down, it cannot make it true. Code may be operationally impeccable and mean nothing anyone can state, or mean something clear that is false of the domain.

Truth is therefore a person's question, and only of a person who can read the text back into the facts it describes. Here philosophy and engineering are one activity: what is under construction is a description true of the world and recoverable by someone else, and code is what the work leaves behind.

Readability is structural, not a preference. A description no reader can read back into facts can no longer be compared with them, contradicted or corrected: the program becomes unfalsifiable. What survives is behavior, which can be measured but not reasoned about, so the program can be changed only by disturbance and observation.

A failure of understanding is a fact about a reader, not a property of the text, so no instrument over the text can detect it, and whoever fails cannot tell a plausible reconstruction from the correct one. The state is entered silently and discovered in its consequences.

## Corollaries
- **Cor. 1.** Optimize code for the reader, not the writer. Comprehension is the scarce resource, not keystrokes.
- **Cor. 2.** "It works" is a necessary condition, not a sufficient one. Review should be willing to reject correct code that cannot be understood.
- **Cor. 3.** Prefer names, structure, and control flow a stranger could follow over cleverness only the author can decode.
- **Cor. 4.** If explaining a piece of code takes longer than rewriting it clearly, rewrite it.
- **Cor. 5.** Do not judge clarity from the author's seat: the author reads with the description already in hand, the one advantage the next reader lacks.
- **Cor. 6.** When a reader misreads the code, treat it as a defect report about the code. It is the only instrument there is, and it fires late.
- **Cor. 7.** A green suite over code no one understands is evidence of stability, not of correctness. Recovering the description is prerequisite to trusting the tests, not a consequence of them.
- **Cor. 8.** When the description in the code and the facts disagree, the code is wrong even where its behavior is right.

## Exceptions
- Genuinely irreducible complexity: some domains (numerics, cryptography, performance-critical kernels) contain code that is inherently hard to follow. Here the duty shifts to making the surrounding context, invariants, and references understandable, even when the core cannot be simplified.
- Throwaway code with a truly short life (a one-off migration, a spike) may not be worth the investment, provided it really does die quickly.
