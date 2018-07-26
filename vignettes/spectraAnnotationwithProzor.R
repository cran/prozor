## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library(prozor)
#library(reshape2)

rm(list=ls())

file = system.file("extdata/IDResults.txt.gz" , package = "prozor")
specMeta <- readr::read_tsv(file)


## ------------------------------------------------------------------------

nrow(specMeta)
hist(specMeta$score, breaks=100)


