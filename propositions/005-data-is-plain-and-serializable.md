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
