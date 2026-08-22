library(readxl)
library(DESeq2)
library(dplyr)

pheno <- read_excel("C:/Users/gbloc/Desktop/PCDHG_Gila/Transcriptomic rna seq data/GSE302582/Data/GSE302582_phenotypes.xlsx")
counts <- read.delim("C:/Users/gbloc/Desktop/PCDHG_Gila/Transcriptomic rna seq data/GSE302582/Data/GSE302582_counts.tsv")

head(counts)
head(pheno)
head(pheno_raw)
unique(pheno$Sex)

coldata <- pheno
coldata$age <- as.factor(coldata$age)

colnames(coldata)

dds <- DESeqDataSetFromMatrix(round(as.matrix(counts)), colData = coldata, design = ~ age + sex)
dds1 <- DESeq(dds)
res <- results(dds)

df_results <- as.data.frame(result)
rownames(df_results) <- res@rownames
head(df_results)

# Map Ensembl to gene symbols 
gtf<- file.path(df_results, "Human.GRCh38.p14.gtf")
gtf_df<- as.data.frame(rtracklayer::import(gtf))

library(rtracklayer)
gtf <- "C:/Users/gbloc/OneDrive/Desktop/PCDHG_Gila/Coding/Human.GRCh38.p14.gtf"



save(df_results,file = )
write.csv(df_results, file ="C:/Users/gbloc/OneDrive/Desktop/PCDHG_Gila/Coding/DALE_metanalysis")
