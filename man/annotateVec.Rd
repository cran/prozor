% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DeprecatedAnnotatePeptides.R
\name{annotateVec}
\alias{annotateVec}
\title{annotate vector of petpide sequences against fasta file (Deprecated)}
\usage{
annotateVec(pepseq, fasta, digestPattern = "(([RK])|(^)|(^M))",
  mcCores = NULL)
}
\arguments{
\item{pepseq}{peptide sequences}

\item{fasta}{fasta file}

\item{digestPattern}{digest pattern as regex}

\item{mcCores}{nr of cores to use}
}
\description{
annotate vector of petpide sequences against fasta file (Deprecated)
}
\examples{

library(prozor)
file = system.file("extdata/shortfasta.fasta.gz",package = "prozor")
fasta = readPeptideFasta(file = file)

res = annotateVec(pepprot[1:20,"peptideSeq"],fasta)
head(res)
}
