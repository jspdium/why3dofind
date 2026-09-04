#!/bin/sh
# Install why3find packages from the repo's own sources.
# Run this once after cloning, before `why3find prove`.

set -e

PKGROOT=$(why3find where)

install_pkg() {
  name="$1"
  src="$2"
  echo "installing $name <- $src"
  mkdir -p "$PKGROOT/$name"
  cp "$src" "$PKGROOT/$name/$(basename "$src")"
  echo '{}' > "$PKGROOT/$name/META.json"
}

# base library
install_pkg inductiveness.mlw stateMachineModels/inductiveness.mlw
install_pkg refinement.mlw    stateMachineModels/refinement.mlw

# counter
install_pkg counter     examples/counter/counter.mlw
install_pkg counter_alt examples/counter/counter_alt.mlw

# twoPhase
install_pkg alternate   examples/twoPhase/alternate.mlw

# mutualExclusionConcurrent
install_pkg mutexAbstractN examples/mutualExclusionConcurrent/mutexAbstractN.mlw
install_pkg mutexAbstract  examples/mutualExclusionConcurrent/mutexAbstract.mlw
install_pkg Peterson       examples/mutualExclusionConcurrent/Peterson.mlw

# mutualExclusionToken
install_pkg oneToken        examples/mutualExclusionToken/oneToken.mlw

# leaderElection
install_pkg leaderElect     examples/leaderElection/leaderElect.mlw
install_pkg leaderElectMax  examples/leaderElection/leaderElectMax.mlw

# waitFreeRegister
install_pkg slotsAbstract   examples/waitFreeRegister/slotsAbstract.mlw

# paxos
install_pkg consensus       examples/paxos/consensus.mlw
install_pkg voting          examples/paxos/voting.mlw

# leaderElection (student contribution: João Gonçalves, Carlos Pina)
install_pkg leaderElectMaxAlive              examples/leaderElection/leaderElectMaxAlive.mlw
install_pkg bully                            examples/leaderElection/Bully.mlw
install_pkg leaderElectDynamicFull           examples/dynamicBully/leaderElectDynamicFull.mlw
install_pkg leaderElectMaxAliveDynamicFull   examples/dynamicBully/leaderElectMaxAliveDynamicFull.mlw
install_pkg bullyDynamicFull                 examples/dynamicBully/bullyDynamicFull.mlw

# wip/petersonN (student project)
install_pkg mutual_exclusion_spec            wip/petersonN/refinement/mutual_exclusion_spec.mlw
install_pkg filter_abstract                 wip/petersonN/refinement/filter_abstract.mlw
install_pkg mutexAbstractN_cyclic           wip/petersonN/refinement/mutexAbstractN_cyclic.mlw

# raft (student project: Ana Sá Oliveira, Edgar Araújo, Gabriel Paiva)
install_pkg raft_msg                        examples/raft/raft_msg.mlw
install_pkg raft_shm                        examples/raft/raft_shm.mlw
install_pkg raft_refi                       examples/raft/raft_refi.mlw

echo "done. packages installed:"
why3find list
