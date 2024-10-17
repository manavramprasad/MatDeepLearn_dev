data_paths=(
    "data/Matbench/MOF_data_npj/raw"
    "data/Matbench/Surface_data_npj/raw"
)

pt_paths=(
    "data/MOF"
    "data/Surface"
)

target_paths=(
    "data/Matbench/MOF_data_npj/targets.csv"
    "data/Matbench/Surface_data_npj/targets.csv"
)


seeds=(
    111
    222
    333
    444
    555
)

# dry run
for i in {0..1}; do
    data_path=${data_paths[i]}
    pt_path=${pt_paths[i]}
    target_path=${target_paths[i]}

    for seed in "${seeds[@]}"; do
        echo "data_path: $data_path"
        echo "pt_path: $pt_path"
        echo "seed: $seed"

        python scripts/main.py \
            --run_mode=train \
            --config_path=configs/pretrain2.yml \
            --src=$data_path \
            --target_path=$target_path \
            --pt_path=$pt_path \
            --seed=$seed \
            --processed=False
    done
done
