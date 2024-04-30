#!/bin/bash

# Users should specify the path to the launcher directory and the dataset in the
# commandline or in this run script.
NEMO_MEGATRON_LAUNCHER_DIR=${NEMO_MEGATRON_LAUNCHER_DIR:-"/opt/NeMo-Megatron-Launcher"}
DATA_DIR=${DATA_DIR}
TEST_NAME="126m_a100_1node_evaluation"
export CHAKRA_DIRECTORY=${NEMO_MEGATRON_LAUNCHER_DIR}/results/${TEST_NAME}/
#export CHAKRA_BARRIER="yes"
export CHAKRA_CRASH="yes"
export CHAKRA_STEP="10"

#Users should setup their cluster type in /launcher_scripts/conf/config.yaml
python3 ${NEMO_MEGATRON_LAUNCHER_DIR}/launcher_scripts/main.py \
evaluation=gpt3/evaluate_lambada \
stages=[evaluation] \
launcher_scripts_path=${NEMO_MEGATRON_LAUNCHER_DIR}/launcher_scripts \
data_dir=${DATA_DIR} \
base_results_dir=${NEMO_MEGATRON_LAUNCHER_DIR}/results \
#cluster_type=interactive \

