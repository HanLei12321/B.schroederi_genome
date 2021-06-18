#!/usr/bin/bash

### input parameters
## population name
pop=$1
## genome file
genome=$2

### software source
## : https://faculty.washington.edu/browning/beagle

## 00.bam2diploid
samtools mpileup -C50 -uf ${genome} out.bam | bcftools view -c  - | bcftools/vcfutils.pl vcf2fq -d 8 -D 42 >out.bam.fa
## 01.fa2psmcfa
fq2psmcfa -q20 out.bam.fa >out_psmc.fa
## 02.splitfa
splitfa  out_psmc.fa > out_split.psmcfa
## 03.calc
psmc -N25 -t15 -r5 -p 4+25*2+4+6 -o  out_split.psmcfa out_split.psmcfa

