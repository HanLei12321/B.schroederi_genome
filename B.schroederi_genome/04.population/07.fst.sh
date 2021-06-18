#!/usr/bin/bash

### input parameters
## population name
pop=$1

### software source
## VCFtools: https://vcftools.github.io

### Steps
## calculate genetic differentiation (Fst) by VCFtools
vcftools --gzvcf ${pop}.snp.vcf.gz --weir-fst-pop population1.txt --weir-fst-pop population2.txt --fst-window-size 50000 --fst-window-step 10000 --out ${pop}.fst
