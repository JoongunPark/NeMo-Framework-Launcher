#!/bin/bash

#Users should setup their cluster type in /launcher_scripts/conf/config.yaml
NEMO_MEGATRON_LAUNCHER_DIR=${NEMO_MEGATRON_LAUNCHER_DIR:-"/opt/NeMo-Megatron-Launcher"}
DATA_DIR=${DATA_DIR}
TEST_NAME="llama2_7b_bf16"
#export CHAKRA_DIRECTORY=${NEMO_MEGATRON_LAUNCHER_DIR}/results/${TEST_NAME}/
#export CHAKRA_BARRIER="yes"
#export CHAKRA_CRASH="yes"
#export CHAKRA_STEP="40"

HYDRA_FULL_ERROR=1 python3 ${NEMO_MEGATRON_LAUNCHER_DIR}/launcher_scripts/main.py \
training=llama/llama2_7b \
stages=[training] \
container=/lustre/fsw/portfolios/nvr/users/tedj/containers/update_for_24.05-py3-devel.sqsh \
data_dir=${DATA_DIR} \
launcher_scripts_path=${NEMO_MEGATRON_LAUNCHER_DIR}/launcher_scripts \
base_results_dir=${NEMO_MEGATRON_LAUNCHER_DIR}/results \
training.run.name="${TEST_NAME}" \
training.run.time_limit=1:15:00 \
training.trainer.num_nodes=1 \
training.model.global_batch_size=128 \
training.model.fp8=False \
training.model.fp8_hybrid=False \
training.trainer.max_steps=10 \
training.trainer.val_check_interval=20 \
training.exp_manager.create_checkpoint_callback=False \
training.model.chakra_profile.enabled=True \
training.model.chakra_profile.start_step=2 \
training.model.chakra_profile.end_step=3 \
training.model.chakra_profile.warmup_steps=1 \
training.model.chakra_profile.active_steps=1 \

#training.model.nsys_profile.enabled=True \
#training.model.nsys_profile.start_step=2 \
#training.model.nsys_profile.end_step=3 \
#cluster_type=interactive \

#training.model.chakra_profile.enabled=True \
#training.model.chakra_profile.start_step=2 \
#training.model.chakra_profile.end_step=3 \
#training.model.chakra_profile.warmup_steps=1 \
#training.model.chakra_profile.active_steps=1 \



#training.model.tensor_model_parallel_size=2 \
#training.model.pipeline_model_parallel_size=2 \
#cluster_type=interactive \

#training.model.chakra_profile.enabled=True \
#training.model.chakra_profile.start_step=2 \
#training.model.chakra_profile.end_step=4 \
#training.model.chakra_profile.warmup_steps=1 \
#training.model.chakra_profile.active_steps=2 \
