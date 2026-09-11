# State Machine Models

Base library modules providing the general theories used throughout
the repository for reasoning about state machine specifications.

## Files

- [inductiveness.mlw](inductiveness.mlw): abstract theory of
  inductive invariants and reachability. Cloned by every module that
  proves a safety property via an inductive invariant.
- [refinement.mlw](refinement.mlw): abstract theory of refinement
  between state machine specifications. Cloned by every module that
  proves a refinement mapping.

These modules are registered as why3find packages and imported by all
example folders.
