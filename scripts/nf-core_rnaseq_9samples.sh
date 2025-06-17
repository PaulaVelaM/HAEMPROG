#!/bin/bash 
#SBATCH --job-name=rnaseq_pipeline
#SBATCH --output=rnaseq_%j.out 
#SBATCH --error=rnaseq_%j.err 
#SBATCH --partition=hpc
#SBATCH --mem=128000MB 
#SBATCH --time=48:00:00 
#SBATCH --cpus-per-task=12   
 

# Pipeline version -r 3.18.0
# https://nf-co.re/rnaseq/3.18.0

# Load required software modules
module load singularity
module load Java/17.0.2

# Specify the Nextflow version
NXF_VER=23.10.0  


# Run the nf-core/rnaseq pipeline with Nextflow
nextflow run nf-core/rnaseq -r 3.18.0 \
	--input samplesheet.csv \ # RNA from HSCs
	--outdir ./RESULTS \
	--aligner star_rsem \ # STAR for alignment, RSEM for quantification
	--gtf Homo_sapiens.GRCh38.112_chr.gtf.gz \
	--fasta Homo_sapiens.GRCh38.dna_sm.primary_assembly_chr.fa.gz \ # Reference genome
	-profile singularity \ # Use the Singularity profile for container execution
	-with-timeline \
	-resume | tee -a nfcore_rnaseq.log
