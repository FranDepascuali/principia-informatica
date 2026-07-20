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
