#!/bin/bash
#

###Do this only once for first time setup or when working with new genome###
# NCBI version gtf annotation and fasta .fa genome sequence files were downloaded from Ensemble https://uswest.ensembl.org/Rattus_norvegicus/Info/Index
# The fasta genome sequence file is 'Homo_sapiens.GRCh38.dna.primary_assembly.fa' was downloaded from gencode using the following command 
wget ftp://ftp.ensembl.org/pub/release-92/fasta/Rattus_norvegicus/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
gunzip Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
# The 'Homo_sapiens.GRCh38.92.gtf' gtf annotation file is was downloaded from gencode using the following command 
wget ftp://ftp.ensembl.org/pub/release-92/gtf/Rattus_norvegicus/Homo_sapiens.GRCh38.92.gtf.gz
gunzip Homo_sapiens.GRCh38.92.gtf.gz

#build genome bowtie index do this once, takes 2hour 30min approx
bowtie2-build Homo_sapiens.GRCh38.dna.primary_assembly.fa GRCh38

#build tophat transcriptome index, it will reconstitute fasta file of genome from index, do not interupt, takes around 1hour
tophat -G /home/smukherjee/GRCh38/Homo_sapiens.GRCh38.92.gtf --transcriptome-index /home/smukherjee/GRCh38/GRCh38trans_Index/GRCh38 /home/smukherjee/GRCh38/GRCh38
#when above is complete from the tophat tmp folder move the reconstitued GRCh38.fa fasta genome file up a folder i.e. to GRCh38 and delete this tophat folder
#This above method is a fix for errors of 'cannot map long reads' and cannot find fasta file, and other issues of tophat mapping

#'Homo_sapiens.GRCh38.dna.primary_assembly.fa' renamed and indexed as 'GRCh38.fa' by tophat and bowtie2 above is used in the downstream steps of the pipeline 
#'Homo_sapiens.GRCh38.92.gtf' renamed and indexed as 'GRCh38.gtf' by tophat and bowtie2 above is used in the downstream steps of the pipeline 