#!/bin/bash
#

################This script is for GSE93991################
#Run this script in a new directory
#mkdir GSE93991 
#This script assumes all the tools are in your path. If not specify the path of your tools.

#'Homo_sapiens.GRCh38.dna.primary_assembly.fa' renamed and indexed as 'GRCh38.fa' by tophat and bowtie2 above is used in the downstream steps of this pipeline 
#'Homo_sapiens.GRCh38.92.gtf' renamed and indexed as 'GRCh38.gtf' by tophat and bowtie2 above is used in the downstream steps of this pipeline 

###Step 1 getting fastq raw reads####
#Reference: https://bioinformatics.stackexchange.com/questions/2644/download-multiple-sra-files?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
for ((i=5196886;i<=5196900;i++)) 
do
fastq-dump --gzip --split-files --accession SRR$i
echo 'Hi SGN blue group I am done getting fastq.gz files from GEO' 
done

###Step2 fastqc quality check of your reads###
fastqc *.fastq.gz
echo 'Hi SGN blue group I am done doing fastqc quality check' 
done

###Step3 mapping with tophat###
#First unzip files for use in tophat
gunzip *.fastq.gz

#Now actual tophat the SE
for i in SRR5196886_1 SRR5196887_1 SRR5196888_1 SRR5196889_1 SRR5196890_1 SRR5196891_1 SRR5196892_1 SRR5196893_1 SRR5196894_1 SRR5196895_1 SRR5196896_1 SRR5196897_1 SRR5196898_1 SRR5196899_1 SRR5196900_1
do
#tophat -o /home/smukherjee/GSE93991_map/tophat_$i -G /home/smukherjee/GRCh38/GRCh38.gtf --no-novel-juncs /home/smukherjee/GRCh38/GRCh38 $i.fastq
tophat -o /home/smukherjee/GSE93991_map/tophat_$i --b2-very-fast --no-coverage-search --no-novel-juncs -G /home/smukherjee/GRCh38/GRCh38.gtf --transcriptome-index /home/smukherjee/GRCh38/GRCh38trans_Index/GRCh38 /home/smukherjee/GRCh38/GRCh38 $i.fastq.gz
echo 'Hi SGN blue group I am done mapping SE to bam'
done

#Now actual tophat the PE
for i in SRR5196886 SRR5196887 SRR5196888 SRR5196889 SRR5196890 SRR5196891 SRR5196892 SRR5196893 SRR5196894 SRR5196895 SRR5196896 SRR5196897 SRR5196898 SRR5196899 SRR5196900
do
tophat -o /home/smukherjee/GSE93991_map/tophat_$i --b2-very-fast --no-coverage-search --no-novel-juncs -G /home/smukherjee/GRCh38/GRCh38.gtf --transcriptome-index /home/smukherjee/GRCh38/GRCh38trans_Index/GRCh38 /home/smukherjee/GRCh38/GRCh38 ${i}_1.fastq ${i}_2.fastq
echo 'Hi SGN blue group I am done mapping SE to bam'
done

#To do tophat indivisually writing out files do like below
#tophat -o /home/smukherjee/GSE93991_map/tophat_SRR1593507 --b2-very-fast --no-coverage-search --no-novel-juncs -G /home/smukherjee/GRCh38/GRCh38.gtf --transcriptome-index /home/smukherjee/GRCh38/GRCh38trans_Index/GRCh38 /home/smukherjee/GRCh38/GRCh38 SRR1593507_1.fastq SRR1593507_2.fastq

###Step4 sort bam files with samtools###
#samtools sort and index bam file
#http://quinlanlab.org/tutorials/samtools/samtools.html
for ((i=5196886;i<=5196900;i++))
do
samtools sort SRR${i}_accepted_hits.bam -o SRR${i}_sort_accepted_hits.bam
done

#To use samtools individually use code below
#samtools sort SRR2531549_accepted_hits.bam -o SRR2531549_sort_accepted_hits.bam

###Step5 htseq count bam files with htseqtools###
#Usage of htseqcount
#http://htseq.readthedocs.io/en/master/count.html
#htseq-count
#  -s {yes,no,reverse}, --stranded {yes,no,reverse} whether the data is from a strand-specific assay.Specify 'yes', 'no', or 'reverse' (default: yes).'reverse' means 'yes' with reversed strand interpretation
#htseq-count [options] <alignment_files> <gff_file>
for ((i=5196886;i<=5196900;i++))
do
htseq-count -f bam -r pos -t gene -i gene_name -s no SRR${i}_sort_accepted_hits.bam /home/smukherjee/GRCh38/GRCh38.gtf > SRR${i}.txt
done

#To use htseq count individually use code below
#htseq-count -f bam -r pos -t gene -i gene_name -s no SRR2531546_sort_accepted_hits.bam /home/smukherjee/GRCh38/GRCh38.gtf > SRR2531546.txt



















