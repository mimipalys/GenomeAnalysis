
if(!requireNamespace("BiocManager", quietly = TRUE))
{
  install.packages("BiocManager")
}
BiocManager::install("DESeq2", version = "3.16")
BiocManager::install(version = '3.16')
library("DESeq2")
install.packages("pheatmap")
library("pheatmap")
install.packages("seqinr")
library(seqinr)
install.packages("openxlsx", dependencies = TRUE)

htseq_table <- read.delim("~/Desktop/genomeAnalysisProjectMK2/combined_file.txt", header = FALSE, sep = '\t', col.names = c("locus_tag", "ERR2036629",  "ERR2036630",  "ERR2036631",  "ERR2036632", "ERR2036633"))


directory <- "~/Desktop/genomeAnalysisProjectMK2/analysis/02_diff_expression/04_HTSeq"
sampleFiles <- grep("output",list.files(directory),value=TRUE)
sampleNames <- c("ERR2036629",  "ERR2036630",  "ERR2036631",  "ERR2036632", "ERR2036633")
sampleCondition <- c("Continuous",  "Continuous",  "Bioleaching",  "Bioleaching", "Continuous")
sampleTable <- data.frame(sampleName = sampleNames,
                          fileName = sampleFiles,
                          condition = sampleCondition)
id <- c("ERR2036629",  "ERR2036630",  "ERR2036631",  "ERR2036632", "ERR2036633")
sampleTable_condition <- data.frame(sampleName = id,
                                    condition = sampleCondition)

deseq_obj <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                        directory = directory,
                                        design = ~ condition)

deseq_result <- DESeq(deseq_obj)

res <- results(deseq_result)
plotMA(res, alpha=0.05, ylim=c(-2,2))

res_zero <- res
res_zero$padj <- ifelse(is.na(res_zero$padj), 1, res_zero$padj)
res_zero$log2FoldChange <- ifelse(is.na(res_zero$log2FoldChange), 0, res_zero$log2FoldChange)
data_log <- res_zero[res_zero$padj <= 0.05, ]
data_log_sorted <- data_log[ with(data_log, order(data_log$log2FoldChange, decreasing=TRUE)), ]
top_10 <- data_log_sorted[1:10, ]
top_names <- rownames(top_10)

data_log_sorted <- data_log[ with(data_log, order(data_log$log2FoldChange, decreasing=FALSE)), ]
low_10 <- data_log_sorted[1:10, ]
low_names <- rownames(low_10)

table(sign(data_log$log2FoldChange))
print(sum(data_log$log2FoldChange > 0))
print(sum(data_log$log2FoldChange < 0))

filter_rows <- c(top_names, low_names)

df <- sampleTable_condition
rownames(df) <- colnames(deseq_result)
vsd <- vst(deseq_result)
pheatmap(assay(vsd)[rownames(vsd) %in% filter_rows, ], cluster_rows=TRUE, show_rownames=TRUE, cluster_cols=TRUE, annotation_col = df)

plotPCA(vsd, intgroup=c("condition"))
