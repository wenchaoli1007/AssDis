library(AssDis)
library(dplyr)
library(readr)

sepsis_valerie_degs = read_tsv("../../algorithm/results/disease/covid2_severe_mild_degs.txt")
sepsis_valerie_degs = sepsis_valerie_degs %>% filter(abs(avg_log2FC) > 0.25)

inputs = sepsis_valerie_degs[,c("gene", "avg_log2FC")]
colnames(inputs) = c("gene", "value")
load("./test/TIGs.RData")

refs = data.frame(ti_gene)
res = DisAssoc(inputs, "down", c(1), 0.25, "no", refs)

plots = PlotAssoc(res)
plots
