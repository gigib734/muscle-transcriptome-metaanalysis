library(readxl)
library(DESeq2)
library(dplyr)

pheno <- read_excel("Z:/Students/Michael/lab/transcriptomics/datasets/DALE/Data/DALE_phenotypes.xlsx")
counts <- read.delim("z:/Students/Michael/lab/transcriptomics/datasets/DALE/Data/DALE_counts.tsv")

head(counts)
head(pheno)
head(pheno_raw)
unique(pheno$Sex)

coldata <- pheno
coldata$age <- as.factor(coldata$age)


dds <- DESeqDataSetFromMatrix(round(as.matrix(counts)), colData = coldata_2, design = ~ age + Sex)
dds <- DESeq(dds)
res <- results(dds)

df_results <- as.data.frame(result)
rownames(df_results) <- res@rownames
head(df_results)

save(df_results,file = )
write.csv(df_results, file ="C:/Users/gbloc/OneDrive/Desktop/PCDHG_Gila/Coding/DALE_metanalysis")
C:\Users\gbloc\OneDrive\Desktop
