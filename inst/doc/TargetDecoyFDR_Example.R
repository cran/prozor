## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  message = FALSE,
  warning = FALSE
)

## ----targetdecoy, fig.cap = "Black line - Score distribution of decoy hits. Green line - Score distribution of vorward hits. TN - true netagive, FN - false negative, FP - false postitive, TP - true positive", echo = FALSE----
x <- seq(0,10,by = 0.1)
y1 <- dnorm(x,mean = 3, sd = 1)
y2 <- dnorm(x,mean = 5, sd = 1)
plot(x, y1, type = "l", xlab = 'score')
lines(x, y2, col = 3)
abline(v = 3.5, col = 2)
text(c(2,4.2) , y = c(.2,.2), labels = c("TN","FP"))
text(c(3,7) , y = c(.1,.1), labels = c("FN","TP"), col = 3)
legend("topright", legend = c("Forward", "Decoys"), lty = c(1,1), col = c(3,1))


## -----------------------------------------------------------------------------
rm(list = ls())
library(dplyr)
library(prozor)
data(fdrSample)
x <- dplyr::arrange(fdrSample, score2)
knitr::kable(head(fdrSample))


## -----------------------------------------------------------------------------
table(grepl("REV_",fdrSample$proteinID))

## ----fig.width=7, fig.height=7------------------------------------------------
fdr1 <- computeFDR(fdrSample$score, grepl("REV_",fdrSample$proteinID),larger_better = FALSE)
plotFDR(fdr1)
legend("topright", legend = c("FPR", "qValue/FDR"), lty = c(1,1), col = c(4,3))


## -----------------------------------------------------------------------------
knitr::kable(head(data.frame(fdr1)))

## ----fig.width=7, fig.height=7------------------------------------------------
plot(fdr1$score, fdr1$SimpleFDR, type = "l", xlim = c(0,0.002), ylim = c(0,0.0005))
lines(fdr1$score, fdr1$qValue_SimpleFDR, col = 3, type = "l", xlim = c(0,0.002), ylim = c(-0.002,0))
legend("topleft", legend = c("FDR", "qValue"), lty = c(1,1), col = c(1,3))


## -----------------------------------------------------------------------------

(score01G <- predictScoreFDR(fdr1,qValue = 5,method = "FPR"))
dim(dplyr::filter(fdrSample, score < score01G))

(score01G <- predictScoreFDR(fdr1,qValue = 1,method = "FPR"))
dim(dplyr::filter(fdrSample, score < score01G))

(score01K <- predictScoreFDR(fdr1,qValue = 1,method = "SimpleFDR"))
dim(dplyr::filter(fdrSample, score < score01K))


## -----------------------------------------------------------------------------
knitr::kable(head(data.frame(ID = fdrSample$proteinID[fdr1$order], fdr1)))

## -----------------------------------------------------------------------------
fdr1 <- computeFDRwithID(fdrSample$score,fdrSample$proteinID, decoy = "REV_",larger_better = FALSE)
knitr::kable(head(data.frame(fdr1)))

## -----------------------------------------------------------------------------
sessionInfo()

