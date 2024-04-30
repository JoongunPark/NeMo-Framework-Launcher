#!/bin/bash

# Users should specify the path to the launcher directory and the dataset in the
# commandline or in this run script.
NEMO_MEGATRON_LAUNCHER_DIR=${NEMO_MEGATRON_LAUNCHER_DIR:-"/opt/NeMo-Megatron-Launcher"}
DATA_DIR=${DATA_DIR}
export CHAKRA_DIRECTORY=${NEMO_MEGATRON_LAUNCHER_DIR}/results/20b_a100_2node_mock/

#Users should setup their cluster type in /launcher_scripts/conf/config.yaml
python3 ${NEMO_MEGATRON_LAUNCHER_DIR}/launcher_scripts/main.py \
training=gpt3/20b \
stages=[training] \
launcher_scripts_path=${NEMO_MEGATRON_LAUNCHER_DIR}/launcher_scripts \
data_dir=${DATA_DIR} \
base_results_dir=${NEMO_MEGATRON_LAUNCHER_DIR}/results \
training.run.name="20b_a100_2node_mock" \
training.trainer.num_nodes=2 \
training.model.global_batch_size=256 \
training.model.micro_batch_size=2 \
training.model.tensor_model_parallel_size=4 \
training.model.pipeline_model_parallel_size=1 \
training.run.time_limit=0:20:00 \
training.model.data.data_impl="mock" \
training.model.data.data_prefix=[] \
training.exp_manager.create_checkpoint_callback=False \
training.trainer.val_check_interval=64 \
training.trainer.max_steps=20 \
#cluster_type=interactive 
