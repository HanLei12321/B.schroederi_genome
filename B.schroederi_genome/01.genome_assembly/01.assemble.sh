#!/usr/bin/bash

#Nextdenovo assemble 
python nextDenovo /Path/to/run.cfg

#Polish use Arrow and Nextpolish 
pbalign --tmpDir // --nproc 20 --minAccuracy 80  --concordant --algorithm blasr  input.fofn /Path/to/genome.fasta aln.bam
variantCaller --algorithm=arrow -j 20  -r /Path/to/genome.fasta aln.bam  -o variants.gff -o cns.fasta -o cns.fastq || echo arrow failed
nextPolish run_polish.cfg

#HIC pipeline
juicer.sh -t 16 -z genome/B.schroederi.fasta -p genome/B.schroederi.fasta.chrom.sizes -y genome/B.schroederi.fasta_MboI.txt -s MboI -S early -d ./01.Juicer -D /software/juicer/CPU
#3d-dna-master software from github. 	https://github.com/aidenlab/3d-dna
/3d-dna-master/run-asm-pipeline.sh B.schroederi.fasta merged_nodups.txt
