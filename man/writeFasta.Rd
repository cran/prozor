% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/writeFasta.R
\name{writeFasta}
\alias{writeFasta}
\title{write fasta lists into file}
\usage{
writeFasta(file, ...)
}
\arguments{
\item{file}{where to write}

\item{...}{fasta list or single file}
}
\value{
writes a file.
}
\description{
peptides which do not have protein assignment drop out
}
\examples{
#example how to create a protein db with decoy sequences
library(seqinr)
#library(prozor)
file = system.file("extdata/fgcz_contaminants2021_20210929.fasta.gz",package = "prozor")
fasta = readPeptideFasta(file = file)
revfasta <- reverseSeq(fasta)
decoyDB <- c(fasta,revfasta)
stopifnot(length(decoyDB) == 2 * length(fasta))
\dontrun{
writeFasta(decoyDB, file="test.fasta")
}
}
