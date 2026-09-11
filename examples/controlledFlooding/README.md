# Controlled Flooding Broadcast

Formalization of a controlled flooding protocol for reliable broadcast
in a network. Proves safety (no message duplication, bounded inbox
cardinality) and termination properties using an inductive invariant.

## Files

- [controlledFlooding.mlw](controlledFlooding.mlw): standalone
  specification of the controlled flooding algorithm with safety and
  termination proofs

*(Contribution by: Goncalo Caixeiro. Adapted to the why3do refinement
framework.)*
