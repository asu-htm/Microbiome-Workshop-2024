#!/bin/bash

#SBATCH --job-name=fasterq-dump
#SBATCH -o fastq-dump.out
#SBATCH --nodes=1
#SBATCH -t 4:00:00
#SBATCH --cpus-per-task=10

cd $SLURM_SUBMIT_DIR

set -uex

# Record the start time
start_time=$(date)

# set up for conda environments
#export PS1=
#conda init bash
#source ~/.bashrc
module load mamba
source activate FASTQ_PROCESSING

cat Accession-list.txt | while read samples; do
fasterq-dump --split-3 -F --skip-technical $samples;
done

echo "Job complete"
