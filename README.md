# AssDis

AssDis is a R package to calculate the association between TIGs identified in our paper and specific immune disease.

# installation of AssDis
#install.packages("devtools")

devtools::install_github("wenchaoli1007/AssDis")

#download TIGs reference from: 

https://github.com/wenchaoli1007/AssDis/blob/main/test/TIGs.RData


# example
library(AssDis)

library(dplyr)

library(readr)


setwd("./AssDis")

degs = read_tsv("./covid2_severe_mild_degs.txt")

degs = degs %>% filter(abs(avg_log2FC) > 0.25)

inputs = degs[,c("gene", "avg_log2FC")]

colnames(inputs) = c("gene", "value")

load("./test/TIGs.RData")


refs = data.frame(ti_gene)

res = DisAssoc(inputs, "down", c(1), 0, "no", refs)

plots = PlotAssoc(res)

plots
