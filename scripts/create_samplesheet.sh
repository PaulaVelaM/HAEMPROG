#!/bin/bash

# This script generates a "samplesheet.csv" file required by the nf-core/rnaseq pipeline.


# Name of the output file
output="samplesheet.csv"

# Write the header of the CSV file
echo "sample,fastq_1,fastq_2,strandedness" > "$output"

# Find all file ending in "_1.fastq.gz" in the currect directory and subdirectories
find . -type f -name "*_1.fastq.gz" | while read -r f; do
    dir=$(dirname "$f")              # Get the directory of the FASTQ file
    sample=$(basename "$dir")        # Use the folder name as the sample name
    fastq1="$f"                      # Path to the first read
    fastq2="${f/_1.fastq.gz/_2.fastq.gz}" # Path to the second read replacing the one of the first
    strandedness="auto"              # Set it to "auto" so the pipeline detects it automatically

    # Append all this to the CSV file
    echo "$sample,$fastq1,$fastq2,$strandedness" >> "$output"
done
