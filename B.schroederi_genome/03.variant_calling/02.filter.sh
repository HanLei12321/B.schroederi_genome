#!/usr/bin/bash

### input parameters
## population vcf
pop=$1
## reference genome
reference=$2

### software source
## GATK: https://gatk.broadinstitute.org/hc/en-us

### Steps
## select SNPs from raw vcf
gatk SelectVariants --select-type-to-include SNP --reference ${reference} --variant ${pop}.vcf.gz --output ${pop}.raw.snp.vcf.gz

## perform hard filtering
gatk VariantFiltration --variant ${pop}.raw.snp.vcf.gz --filter-expression "QUAL < 30.0 || DP < 1.0 || QD < 2.0 || FS > 60.0 || MQ < 20.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" --filter-name "snp_filter" --genotype-filter --output ${pop}.flag.snp.vcf.gz

##  hardfilter
perl 05.filter.dp.0.01.pl sen.raw.hardfil_true.SNP.2allelic.vcf sen.raw.hardfil_true.SNP.2allelic.dp.vcf  958 28892
perl 07.filter_PLvalue.pl sen.raw.hardfil_true.SNP.2allelic.dp.vcf sen.raw.hardfil_true.SNP.2allelic.dp.PL20.vcf 0.2 20 266
vcftools --vcf sen.raw.hardfil_true.SNP.2allelic.dp.PL13.vcf --maf 0.01 --recode --out alligator_dp_PL13_maf01 --recode-INFO-all

