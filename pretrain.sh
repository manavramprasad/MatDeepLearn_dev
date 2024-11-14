#!/bin/bash
#SBATCH -J pretrain_linspace2.0_orders2_sigmas4  # Job name
#SBATCH -A gts-vfung3                        # Charge account
#SBATCH -N1 --gres=gpu:A100:1                # Number of nodes and GPUs required
#SBATCH --mem-per-gpu=40G                    # Memory per gpu
#SBATCH -t30:00:00                          # Duration of the job (Ex: 15 mins)
#SBATCH -qinferno                            # QOS name
#SBATCH -o featurizer_results/pretrain/linspace2.0_orders2_sigmas4.out               # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL           # Mail preferences
#SBATCH --mail-user=mramprasad3@gatech.edu           # e-mail address for notifications
# export DATASET_SRC_FILE=linspace2.0_orders2_sigmas4
# sed -i "s/DATASET_SRC_FILE/$DATASET_SRC_FILE/" configs/pretrain.yml
source ~/miniconda3/etc/profile.d/conda.sh
conda activate matdeeplearn
echo pretrain
python scripts/main.py --config_path configs/ead_pretrain.yml --run_mode train
