## ----echo=FALSE---------------------------------------------------------------
library(prozor)


## ----fig.retina=3-------------------------------------------------------------
data("masses")
cdsw <- Cdsw(masses , nbins = 25, digits = 1)
cdsw$plot()


## ---- results='markup'--------------------------------------------------------
knitr::kable(cdsw$asTable())

## -----------------------------------------------------------------------------
constError <- cdsw$error()

## -----------------------------------------------------------------------------
cdsw$quantile_breaks()

## ----fig.retina=3, warning=FALSE----------------------------------------------
cdsw$plot()

## ---- results='markup'--------------------------------------------------------
knitr::kable(cdsw$asTable())

## -----------------------------------------------------------------------------
quantileError <- cdsw$error()

## -----------------------------------------------------------------------------
knitr::kable(cdsw$optimizeWindows(maxbin = 10, plot = TRUE) )

## ----fig.retina=3-------------------------------------------------------------
cdsw$sampling_breaks(maxwindow = 100,plot = TRUE)

## ----fig.retina=3-------------------------------------------------------------
cdsw$plot()

## ---- results='markup'--------------------------------------------------------
knitr::kable(cdsw$asTable())

## -----------------------------------------------------------------------------
knitr::kable(cdsw$optimizeWindows(maxbin = 10, plot = TRUE) )

## -----------------------------------------------------------------------------
mixedError <- cdsw$error()

## ----fig.retina=3-------------------------------------------------------------
barplot(c(const = constError$score1, quantile = quantileError$score1, mixed = mixedError$score1),ylab = "Manhattan distance")
barplot(c(const = constError$score2, quantile = quantileError$score2, mixed = mixedError$score2),ylab = "Euclidean distance")


## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

