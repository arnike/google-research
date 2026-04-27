#!/bin/bash
set -euo pipefail

DS=$1
MODEL=$2
RUN_NAME=$3
shift 3

RUN_ID="${DS}_${MODEL}_${RUN_NAME}"
RUN_ROOT="${TB_DIR:-./runs}/train"
RUN_DIR="${RUN_ROOT}/${RUN_ID}"

mkdir -p "$RUN_DIR"
echo "Launching ${RUN_ID}"
echo "Runtime dir: ${RUN_DIR}"

git rev-parse HEAD > "${RUN_DIR}/commit_id.txt"
git diff > "${RUN_DIR}/diff.patch"

CMD=(
  python
  train_lila.py
  "--config-name=train_${DS}"
  "runtime.root=${RUN_ROOT}"
  "runtime.name=${RUN_ID}"
  "model.encoder=${MODEL}"
  "$@"
)

printf '%q ' "${CMD[@]}" | tee "${RUN_DIR}/cmd.bash"
echo

"${CMD[@]}"
