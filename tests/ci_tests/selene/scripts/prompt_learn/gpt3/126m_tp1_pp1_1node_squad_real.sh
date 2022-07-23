HYDRA_FULL_ERROR=1 python3 main.py \
    +ci_test=True \
    prompt_learning=gpt3/squad \
    run_data_preparation=False \
    run_training=False \
    run_conversion=False \
    run_finetuning=False \
    run_prompt_learning=True \
    run_evaluation=False \
    run_export=False \
    bignlp_path=${GIT_CLONE_PATH} \
    data_dir=${BASE_RESULTS_DIR}/data \
    base_results_dir=${BASE_RESULTS_DIR} \
    "container='${BUILD_IMAGE_NAME_SRUN}'" \
    container_mounts=[/lustre/fsw/joc/big_nlp/bignlp_ci_resources:/lustre/fsw/joc/big_nlp/bignlp_ci_resources,/lustre/fsw/joc/yuya/bignlp/bignlp-scripts_gpt3/data:/lustre/fsw/joc/yuya/bignlp/bignlp-scripts_gpt3/data] \
    cluster.partition=${SLURM_PARTITION} \
    cluster.account=${SLURM_ACCOUNT} \
    cluster.gpus_per_task=null \
    cluster.gpus_per_node=null \
    cluster.job_name_prefix="${SLURM_ACCOUNT}-bignlp_ci:" \
    prompt_learning.run.name=${RUN_NAME} \
    prompt_learning.run.time_limit="04:00:00" \
    prompt_learning.run.results_dir=${BASE_RESULTS_DIR}/${RUN_NAME} \
    prompt_learning.run.model_train_name=gpt3_126m \
    prompt_learning.trainer.num_nodes=1 \
    prompt_learning.model.language_model_path=/lustre/fsw/joc/big_nlp/bignlp_ci_resources/checkpoints/gpt3_126m_bf16_O2_tp1_pp1.nemo \
    prompt_learning.model.tensor_model_parallel_size=1 \
    prompt_learning.model.pipeline_model_parallel_size=1
