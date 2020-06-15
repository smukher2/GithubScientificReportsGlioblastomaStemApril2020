#!/bin/bash
#

###Do this only once for first time setup or when working with new genome###
# NCBI version gtf annotation and fasta .fa genome sequence files were downloaded from Ensemble https://uswest.ensembl.org/Rattus_norvegicus/Info/Index
# The fasta genome sequence file is 'rnor6_ensemble_seq_whole_genome.fa' was downloaded from gencode using the following command 
wget ftp://ftp.ensembl.org/pub/release-92/fasta/Rattus_norvegicus/dna/rnor6_ensemble_seq_whole_genome.fa.gz
gunzip rnor6_ensemble_seq_whole_genome.fa.gz
# The 'Rattus_norvegicus.Rnor_6.0.95.gtf' gtf annotation file is was downloaded from gencode using the following command 
wget ftp://ftp.ensembl.org/pub/release-92/gtf/Rattus_norvegicus/Rattus_norvegicus.Rnor_6.0.95.gtf.gz
gunzip Rattus_norvegicus.Rnor_6.0.95.gtf.gz

#build genome bowtie index do this once, takes 2hour 30min approx
bowtie2-build rnor6_ensemble_seq_whole_genome.fa Rnor6

#build tophat transcriptome index, it will reconstitute fasta file of genome from index, do not interupt, takes around 1hour
tophat -G /home/smukherjee/Rnor6/Rattus_norvegicus.Rnor_6.0.95.gtf --transcriptome-index /home/smukherjee/Rnor6/Rnor6trans_Index/Rnor6 /home/smukherjee/Rnor6/Rnor6
#when above is complete from the tophat tmp folder move the reconstitued Rnor6.fa fasta genome file up a folder i.e. to Rnor6 and delete this tophat folder
#This above method is a fix for errors of 'cannot map long reads' and cannot find fasta file, and other issues of tophat mapping

#'rnor6_ensemble_seq_whole_genome.fa' renamed and indexed as 'Rnor6.fa' by tophat and bowtie2 above is used in the downstream steps of the pipeline 
#'Rattus_norvegicus.Rnor_6.0.95.gtf' renamed and indexed as 'Rnor6.gtf' by tophat and bowtie2 above is used in the downstream steps of the pipeline 