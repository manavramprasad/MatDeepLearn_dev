data_paths=(
    "data/Matbench/data_log_gvrh.json"
    "data/Matbench/data_log_kvrh.json"
    "data/Matbench/data_dielectric.json"
)

pt_paths=(
    "data/gvrh"
    "data/kvrh"
    "data/dielectric"
)

seeds=(
    111
    222
    333
    444
    555
)

# dry run
for i in {0..2}; do
    data_path=${data_paths[i]}
    pt_path=${pt_paths[i]}

    for seed in "${seeds[@]}"; do
        echo "data_path: $data_path"
        echo "pt_path: $pt_path"
        echo "seed: $seed"

        python scripts/main.py \
            --run_mode=train \
            --config_path=configs/finetune_new.yml \
            --src=$data_path \
            --pt_path=$pt_path \
            --seed=$seed \
            --processed=False
    done
done
