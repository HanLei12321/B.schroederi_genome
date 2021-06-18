#!/usr/bin/bash

### input parameters
## population name
pop=$1

### software source
## ADMIXTURE: http://dalexander.github.io/admixture/download.html

### Steps
## population structure analysis by ADMIXTURE
for K in {2..5}; do 
	for repeat in {2..5}; do 
		admixture --cv ${pop}.prune.bed ${K} -j4 -s ${repeat} | tee log${K}.${repeat}.out;
	done
done

