#!/bin/bash

# Script to download SRA files and convert them into compressed FASTQ

#BATCH --job-name=prefetch_SRA
#SBATCH --output=prefetch_%j.log
#SBATCH --error=prefetch_%j.err
#SBATCH --partition=highMem
#SBATCH --mem=64000MB
#SBATCH --time=10:00:00
#SBATCH --cpus-per-task=4

module load sratoolkit # To download SRA files
module load parallel  # To process multiple downloads

export THREADS=4  # Number of threads per job
export OUT_DIR="./"


process_sra() {
    SRR_ID=$1
    fasterq-dump --split-files --threads "$THREADS" "$SRR_ID" -O "$OUT_DIR" # Download and convert to FASTQ the SRA file
    gzip "${OUT_DIR}/${SRR_ID}_1.fastq" # Compress the file
    gzip "${OUT_DIR}/${SRR_ID}_2.fastq" # Compress the other file
}

export -f process_sra


# Run 4 jobs in parallel, each using 1 full CPU core
cat SraAccList.txt | parallel -j 4 process_sra

