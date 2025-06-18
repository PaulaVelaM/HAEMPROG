# Data

This folder contains the script to download the raw RNA-seq data used in this project.

## Dataset source
- GEO accession: [GSE233478 - NCBI GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE233478)
- Platform: Bulk RNA-seq of human CD34+CD38-CD90+ hematopoietic stem and progenitor cells from various tissues and developmental stages.

## Contents
- `download_sra.sh`: Bash script that uses `fasterq-dump` to download and convert all SRA files associated with the GEO series into compressed FASTQ files.  

## Usage
Make sure the [SRA Toolkit](https://github.com/ncbi/sra-tools) is installed and accessible from your terminal. Then, run:
```bash
bash download_sra.sh
