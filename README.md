## Snakemake_WASP

Snakemake workflow for allelic bias analysis

### Setup

The pipeline relies on three main directories:

1. Location of WASP source directory
2. Location of VCF files
3. Data (BAM files)

These options are supplied through suitable options in the `config.yaml` file. Edit them
accordingly. Also, Snakemake file (`src/Snakefile`) requires a list of output files to
process based on which it generates the tree. Edit the relevant rule (`rule all`)
accordingly.

### Contact
Vivek Rai, vivekrai@umich.edu
