# Scripts

This folder contains all the scripts used for the analysis carried out in this project.

## Contents

- `DE_analysis_9HSCsamples.Rmd`: R Markdown file for normalization, PCA, gene selection, and differential expression analysis using DESeq2 (of the subset of 9 samples).
- `DE_analysis_106samples.Rmd`: R Markdown file for normalization, PCA, gene selection, and differential expression analysis using DESeq2 (of the full dataset).
- `create_samplesheet.sh`: Bash script that generates the `samplesheet.csv` required to run the nf-core/rnaseq pipeline.
- `nfcore_rnaseq_9samples.sh`: SLURM batch script to run the nf-core/rnaseq on the pilot dataset (9 samples).
- `nfcore_rnaseq_106samples.sh`: SLURM batch script to run the nf-core/rnaseq on the full dataset (106 samples).
- `nextflow.config`: Configuration file for the nf-core/rnaseq pipeline. 
