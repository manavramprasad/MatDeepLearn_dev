data_paths=(
    "data/Matbench/data_mp_form.json"
    "data/Matbench/data_mp_gap.json"
    "data/Matbench/data_2d.json"
)

pt_paths=(
    "data/mp_form"
    "data/mp_gap"
    "data/2d"
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
            --config_path=configs/pretrain.yml \
            --src=$data_path \
            --pt_path=$pt_path \
            --seed=$seed \
            --processed=False
    done
done
