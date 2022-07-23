HYDRA_FULL_ERROR=1 python3 main.py \
    +ci_test=True \
    export=t5 \
    run_data_preparation=False \
    run_training=False \
    run_conversion=False \
    run_finetuning=False \
    run_evaluation=False \
    run_export=True \
    bignlp_path=${GIT_CLONE_PATH} \
    data_dir=${BASE_RESULTS_DIR}/data \
    base_results_dir=${BASE_RESULTS_DIR} \
    "container='${BUILD_IMAGE_NAME_SRUN}'" \
    cluster.partition=${SLURM_PARTITION} \
    cluster.account=${SLURM_ACCOUNT} \
    cluster.gpus_per_task=null \
    cluster.gpus_per_node=null \
    cluster.job_name_prefix="${SLURM_ACCOUNT}-bignlp_ci:" \
    export.run.name=${RUN_NAME} \
    export.run.time_limit="30:00" \
    export.run.model_train_name=t5_220m_tp1_pp1 \
    export.run.results_dir=${BASE_RESULTS_DIR}/${RUN_NAME} \
    export.model.checkpoint_path=${BASE_RESULTS_DIR}/finetune_t5_220m_tp1_pp1_1node_100steps_mnli/checkpoints/megatron_t5_glue.nemo \
    export.model.weight_data_type=fp16 \
    export.model.tensor_model_parallel_size=2 \
    export.triton_deployment.pipeline_model_parallel_size=2 \
    export.triton_deployment.data_type=fp16