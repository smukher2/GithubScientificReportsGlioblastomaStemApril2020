#!/bin/bash
#

###Do this only once for first time setup or when working with new genome###
# NCBI version gtf annotation and fasta .fa genome sequence files were downloaded from Ensemble https://uswest.ensembl.org/Rattus_norvegicus/Info/Index
# The fasta genome sequence file is 'Mus_musculus.GRCm38.dna.primary_assembly.fa' was downloaded from gencode using the following command 
wget ftp://ftp.ensembl.org/pub/release-92/fasta/Rattus_norvegicus/dna/Mus_musculus.GRCm38.dna.primary_assembly.fa.gz
gunzip Mus_musculus.GRCm38.dna.primary_assembly.fa.gz
# The 'Mus_musculus.GRCm38.92.gtf' gtf annotation file is was downloaded from gencode using the following command 
wget ftp://ftp.ensembl.org/pub/release-92/gtf/Rattus_norvegicus/Mus_musculus.GRCm38.92.gtf.gz
gunzip Mus_musculus.GRCm38.92.gtf.gz

#build genome bowtie index do this once, takes 2hour 30min approx
bowtie2-build Mus_musculus.GRCm38.dna.primary_assembly.fa GRCm38

#build tophat transcriptome index, it will reconstitute fasta file of genome from index, do not interupt, takes around 1hour
tophat -G /home/smukherjee/GRCm38/Mus_musculus.GRCm38.92.gtf --transcriptome-index /home/smukherjee/GRCm38/GRCm38trans_Index/GRCm38 /home/smukherjee/GRCm38/GRCm38
#when above is complete from the tophat tmp folder move the reconstitued GRCm38.fa fasta genome file up a folder i.e. to GRCm38 and delete this tophat folder
#This above method is a fix for errors of 'cannot map long reads' and cannot find fasta file, and other issues of tophat mapping

#'Mus_musculus.GRCm38.dna.primary_assembly.fa' renamed and indexed as 'GRCm38.fa' by tophat and bowtie2 above is used in the downstream steps of the pipeline 
#'Mus_musculus.GRCm38.92.gtf' renamed and indexed as 'GRCm38.gtf' by tophat and bowtie2 above is used in the downstream steps of the pipeline 