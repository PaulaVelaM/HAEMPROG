#!/bin/bash 
#SBATCH --job-name=rnaseq_counts
#SBATCH --output=rnaseq_counts_%j.out 
#SBATCH --error=rnaseq_counts_%j.err 
#SBATCH --partition=hpc
#SBATCH --mem=130Gb 
#SBATCH --time=72:00:00 
#SBATCH --cpus-per-task=12   


# Load required software modules
module load singularity
module load Java/17.0.2

# Specify the version of Nextflow
NXF_VER=23.10.0

# Set the singularity cache directory so the containers are not re-downloaded every time
export NXF_SINGULARITY_CACHEDIR=/mnt/beegfs/mmerono/singularity_cache

# Run the nf-core/rnaseq pipeline with Nextflow
# Use STAR for alignment and RSEM for quantification
nextflow run nf-core/rnaseq -r 3.18.0 \
        --input samplesheet.csv \ 
        --outdir /ijc/LABS/MERKEL/RAW/NGS/HAEMPROG/RESULTS \
        --aligner star_rsem \
        --gtf Homo_sapiens.GRCh38.112_chr.gtf.gz \
        --fasta Homo_sapiens.GRCh38.dna_sm.primary_assembly_chr.fa.gz \ # Reference genome
        --skip_markduplicates \
        --skip_bigwig \
        --save_reference \ # Save the STAR/RSEM index for reuse
        --skip_qc \
        -profile singularity \
        -w /ijc/LABS/MERKEL/RAW/NGS/HAEMPROG/WORK \
        -with-timeline \ # Save timeline of the pipeline execution
	-c nextflow.config \ # Use custom configuration file
	--star_index /ijc/PUBLIC/DATA/Reference/ENSEMBL/human/GRCh38/star_index/ \ # Provide pre-build STAR index
	-resume | tee -a rnaseq_counts.log # Resume for next runs
