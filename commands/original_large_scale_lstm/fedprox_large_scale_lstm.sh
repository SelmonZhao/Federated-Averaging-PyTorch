#!/bin/sh

# FedProx experiments in Figure 5, 10 of (McMahan et al., 2016)
## Note: this is equivalent to Reddit dataset under LEAF benchmark
## Large-scale LSTM next word prediction Non-IID split
python3 main.py \
    --exp_name FedProx_Reddit_NextWordLSTM --seed 42 --device cuda \
    --dataset Reddit \
    --split_type pre --test_fraction 0.2 \
    --model_name NextWordLSTM --num_layers 1 --num_embeddings 10000 --embedding_size 192 --hidden_size 256 \
    --algorithm fexprox --eval_fraction 1 --eval_type local --eval_every 20 --eval_metrics seqacc \
    --R 5000 --E 5 --C 0.1 --B 10 --beta 0 \
    --optimizer SGD --lr 6.0 --lr_decay 0.9999 --lr_decay_step 50 --criterion Seq2SeqLoss \
    --mu 0.01
