#!/bin/bash
set -euo pipefail

TASK=$1
MODEL=$2
RUN_NAME=$3
shift 3

RUN_ID="${MODEL}_${RUN_NAME}"
RUN_ROOT="${TB_DIR:-./runs}/evals"
RUN_DIR="${RUN_ROOT}/${RUN_ID}"

mkdir -p "$RUN_DIR"
echo "Launching ${RUN_ID}"
echo "Runtime dir: ${RUN_DIR}"

git rev-parse HEAD > "${RUN_DIR}/commit_id.txt"
git diff > "${RUN_DIR}/diff.patch"

CMD=(
  python
  "eval_${TASK}.py"
  "--config-name=eval"
  "runtime.root=${RUN_ROOT}"
  "runtime.name=${RUN_ID}"
  "model.name=${MODEL}"
  "$@"
)

printf '%q ' "${CMD[@]}" | tee "${RUN_DIR}/cmd.bash"
echo

"${CMD[@]}"
