# GithubScientificReports2020

**Quiescent stem cell marker genes in glioma gene networks are sufficient to distinguish between normal and glioblastoma (GBM) samples. 

Shradha Mukherjee*#
Independent Researcher
Address correspondence to: Shradha Mukherjee, PhD; Garland Avenue, Downtown Los Angeles, Los Angeles, CA 90017, U.S. Email: smukher2@gmail.com
* First author and # Corresponding author


Shradha Mukherjee, PhD in Biochemistry 
MS in Chemistry, MAS in Health Informatics 
Linkedin Link https://www.linkedin.com/in/shradhamukherjee                                                                                        
Researchgate Link https://www.researchgate.net/profile/Shradha_Mukherjee                                                         
Github Link https://github.com/smukher2
Pubmed Link https://www.ncbi.nlm.nih.gov/pubmed/?term=Shradha+Mukherjee   

# Citation: This github repository is made open access in hope that it will enable researchers replicate and/or adapt it for their work. So if you use or adapt the results, inferences and computational pipelines presented here, I will be grateful if you please help by citing it as follows. 


# Mukherjee, S.*# Quiescent stem cell marker genes in glioma gene networks are sufficient to distinguish between normal and glioblastoma (GBM) samples. Scientific Reports (accepted 2020).
 



# Protocol: Organization of folders containing subfolders, files and codes. 

**Step1 RNAseqASUcyverseClusterResultsScript/ 

Contains representative or sample code for analysis of RNA-seq data from rat, mouse and human. Glioblastoma RNA-seq was from human only, while quiescent/proliferative stem cells RNA-seq were from rat, mouse and human. The starting file to run these codes is fastq/bam files to produce htseq counts rest of the DEG, WGCNA and MEGENA pipelines. 
 
**Step2 DEGNoCuffQbyTStemCellspairs/ 

Contains the codes, input files and results for entire analysis of the quiescence vs proliferation differential gene expression analysis with 3 methods (Limma, edgeR and simple comparison of means) starting from htseq count files. The htseq count files were obtained in Step1 above.
The minimum files, folders and .Rmd codes required to reproduce the results are provided. After downloading these if the user runs the .Rmd codes in RStudio using command 'knit to html' or 'Run all' it should reproduce same results. 
  
**Step3 HuDisGBsplitWGCNA/ 

Contains the codes, input files and results for WGCNA analysis of htseq files obtained in Step1 above. Also contains code for characterization of modules with enrichR such as GO analysis; and contains code for Linear Regression/Modeling (to distinguish control and cancer samples) and Survival analysis. 
The minimum files, folders and .Rmd codes required to reproduce the results are provided. After downloading these if the user runs the .Rmd codes in RStudio using command 'knit to html' or 'Run all' it should reproduce same results. 

**Step4 HuDisGBsplitMEGENA/ 

Contains the codes, input files and results for MEGENA analysis of htseq files obtained in Step1 above. Also contains code for characterization of modules with enrichR such as GO analysis;
The minimum files, folders and .Rmd codes required to reproduce the results are provided. After downloading these if the user runs the .Rmd codes in RStudio using command 'knit to html' or 'Run all' it should reproduce same results. 

**Step5 PreservationAnalysis/ 

Contains the codes, input files and results for comparison of MEGENA analysis and WGCNA analysis outputs obtained in Step3 and Step4 above. 
The minimum files, folders and .Rmd codes required to reproduce the results are provided. After downloading these if the user runs the .Rmd codes in RStudio using command 'knit to html' or 'Run all' it should reproduce same results. 

**Footnote: Below are three different methods for installation of R packages. 
*Method 1 replace within "" the package name to be installed
library(BiocInstaller)
biocLite(c("name_of_package1","name_of_package2"))

*Method 2
install.packages(c("name_of_package1","name_of_package2"))

*Method 3
install.packages("BiocManager")
BiocManager::install(c("name_of_package1","name_of_package2"))
 

# Acknowledgements: 

1) SVA: Dr. Jeff Leek http://jtleek.com/genstats/inst/doc/02_13_batch-effects.html and https://www.bioconductor.org/packages/release/bioc/vignettes/sva/inst/doc/sva.pdf
2) WGCNA: Dr. Jeremy Miller https://horvath.genetics.ucla.edu/html/CoexpressionNetwork/JMiller/
3) WGCNA Preservation: Dr. Steve Horvath and Dr. Peter Langfelder https://horvath.genetics.ucla.edu/html/CoexpressionNetwork/ModulePreservation/Tutorials/MiniTutorial-MouseLiver.pdf
4) WGCNA Hub Genes: Dr. Steve Horvath and Dr. Peter Langfelder https://pdfs.semanticscholar.org/5e42/e2185c54874277794395e5825808e5f5709c.pdf
5) MEGENA: Dr. Won-Min Song and Dr. Bin Zhang https://rdrr.io/github/songw01/MEGENA/f/vignettes/MEGENA_pipeline_02202020.Rmd
6) edgeR: https://github.com/smukher2/StemCells_RNAseq_Expression_edgeR_visualization_GO and https://web.stanford.edu/class/bios221/labs/rnaseq/lab_4_rnaseq.html
7) limma: https://kasperdanielhansen.github.io/genbioconductor/html/limma.html and https://ucdavis-bioinformatics-training.github.io/2018-June-RNA-Seq-Workshop/thursday/DE.html

Users new to SVA, WGCNA, MEGENA and Differential Gene Expression methods are encouraged to refer to the above mentioned turotials and pipelines. Other acknowledgements have been added to the best of our knowledge as #comment in the code/pipeline itself. 
