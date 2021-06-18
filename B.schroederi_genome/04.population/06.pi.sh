#!/usr/bin/bash

### input parameters
## population name
pop=$1

### software source
## VCFtools: https://vcftools.github.io

### Steps
## calculate nucleotide diversity by VCFtools
vcftools --gzvcf ${pop}.snp.vcf.gz --window-pi 10000 --window-pi-step 10000 --out ${pop}.pi
