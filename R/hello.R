#' Minimal Protein Set Explaining Peptides
#'
#'  Determine minimal protein set explaining
#'  peptide spectrum matches. Utility functions for creating fasta amino acid databases with decoys and contaminants.
#'  Peptide false discovery rate estimation for target decoy search results on psm, precursor, peptide and protein
#'  level. Computing dynamic swath window sizes based on MS1 and MS2 signal distributions.
#'
#' @name prozor
#' @docType package
#' @import Matrix seqinr
NULL
#' Table containing peptide information
#'
#' @name pepprot
#' @docType data
#' @keywords data
NULL
#' Small version of pepprot dataset to speed up computation
#'
#' @name protpepmetashort
#' @docType data
#' @keywords data
NULL
#utils::globalVariables(c("i"), add = TRUE)

#' MS masses
#' A dataset containing approx 150000 MS1 precursor masses
#' @name masses
#'
#' @docType data
#' @keywords data
NULL

#' Data frame score and proteinID
#'
#' @name fdrSample
#' @docType data
#' @keywords data
NULL


#'
#' @importFrom rlang :=
#' @importFrom readr read_tsv
#' @importFrom docopt docopt
NULL
