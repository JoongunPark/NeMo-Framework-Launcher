#!/bin/bash

# Users should specify the path to the launcher directory and the dataset in the
# commandline or in this run script.
NEMO_MEGATRON_LAUNCHER_DIR=${NEMO_MEGATRON_LAUNCHER_DIR:-"/opt/NeMo-Megatron-Launcher"}
DATA_DIR=${DATA_DIR}
TEST_NAME="126m_a100_1node_24.05"
export CHAKRA_DIRECTORY=${NEMO_MEGATRON_LAUNCHER_DIR}/results/${TEST_NAME}/
#export CHAKRA_BARRIER="yes"
#export CHAKRA_CRASH="yes"
export CHAKRA_STEP="10"

#Users should setup their cluster type in /launcher_scripts/conf/config.yaml
python3 ${NEMO_MEGATRON_LAUNCHER_DIR}/launcher_scripts/main.py \
training=gpt3/126m \
stages=[training] \
container=/lustre/fsw/portfolios/nvr/users/tedj/containers/test.sqsh \
launcher_scripts_path=${NEMO_MEGATRON_LAUNCHER_DIR}/launcher_scripts \
data_dir=${DATA_DIR} \
base_results_dir=${NEMO_MEGATRON_LAUNCHER_DIR}/results \
training.run.name="${TEST_NAME}" \
training.trainer.num_nodes=1 \
training.run.time_limit=2:00:00 \
training.exp_manager.create_checkpoint_callback=False \
training.trainer.val_check_interval=20 \
training.trainer.max_steps=20 \
training.model.global_batch_size=64 \
cluster_type=interactive \
#training.model.nsys_profile.enabled=True \
#training.model.data.data_impl="mock" \
#training.model.data.data_prefix=[] \

#training.model.tensor_model_parallel_size=2 \
#training.model.pipeline_model_parallel_size=2 \

