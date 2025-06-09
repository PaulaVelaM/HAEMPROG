# Scripts

This folder contains all the scripts used for the analysis carried out in this project.

## Contents

- `DESeq2_9samples.Rmd`: R Markdown file for normalization, PCA, gene selection, and differential expression analysis using DESeq2 (of the subset of 9 samples).
- `DESeq2_106samples.Rmd`: R Markdown file for normalization, PCA, gene selection, and differential expression analysis using DESeq2 (of the full dataset).
- `create_samplesheet.sh`: Bash script to automatically generate the `samplesheet.csv` required by the nf-core/rnaseq pipeline.
- `rnaseq_pipeline_106.sh`: SLURM submission script to run nf-core/rnaseq on the full dataset (106 samples).
- `rnaseq_pipeline_9.sh`: SLURM submission script to run nf-core/rnaseq on the pilot dataset (9 samples).
