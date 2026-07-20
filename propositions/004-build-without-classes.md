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
