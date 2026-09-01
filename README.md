# why3dofind

A WhyML library for reasoning about state machine specifications and
distributed systems, using [why3find](https://why3find.readthedocs.io/)
for proof management.

## Structure

```
stateMachineModels/       Base library (inductive invariants, refinement)
examples/counter/         Concurrent counter using a lock, by refinement
examples/twoPhase/        Two-phase handshake protocol, by refinement
examples/mutualExclusionConcurrent/
                          Mutual exclusion algorithms (Peterson, Bakery, etc.)
examples/mutualExclusionToken/
                          Dijkstra self-stabilizing ring and bidirectional array
examples/leaderElection/  Chang-Roberts leader election, by refinement
examples/waitFreeRegister/
                          Simpson's 4-slot wait-free register, by refinement
examples/paxosNoRefinement/
                          Paxos consensus (stand-alone, no refinement)
```

Cross-file dependencies in why3find are resolved through installed
packages, not folder loadpaths. Files that are depended upon by other
files (`inductiveness.mlw`, `refinement.mlw`, `counter.mlw`,
`counter_alt.mlw`, `alternate.mlw`, `mutexAbstractN.mlw`,
`mutexAbstract.mlw`, `Peterson.mlw`) are registered as why3find packages.

## Setup

Requires [Why3](https://why3.lris.fr/) 1.8+,
[why3find](https://why3find.readthedocs.io/) 1.3+, and at least one SMT
prover (CVC5, Alt-Ergo, Z3). See `why3find.json` for the exact prover
versions and tactics used.

```sh
eval $(opam env)
./setup.sh          # install packages from repo sources (run once)
why3find prove -r . # replay all proofs
```

## Commands

```sh
why3find prove .              # update proof certificates
why3find prove -r .           # replay proofs (no changes)
why3find prove -f .           # force rebuild all proofs
why3find prove -i file.mlw    # launch Why3 IDE on failed goals
why3find prove --goals .      # per-goal breakdown
```

## How proofs are stored

Each `.mlw` file has a matching `proof.json` certificate in a
subdirectory of the same name (e.g. `counter.mlw` -> `counter/proof.json`).
These are JSON files recording which prover (or tactic + prover
combination) closes each goal. The `.why3find/` cache directory is
gitignored.
