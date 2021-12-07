## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, message = FALSE)

## ----loadData-----------------------------------------------------------------
library(prozor)

rm(list = ls())

file = system.file("extdata/IDResults.txt.gz" , package = "prozor")
specMeta <- readr::read_tsv(file)
head(specMeta)


## ----fig.cap = "Number of proteins in the All and Canonical database."--------
length(unique(specMeta$peptideSeq))
upeptide <- unique(specMeta$peptideSeq)

resAll <-
    prozor::readPeptideFasta(
        system.file("p1000_db1_example/Annotation_allSeq.fasta.gz" , package = "prozor"))

resCan <-
    prozor::readPeptideFasta(
        system.file("p1000_db1_example/Annotation_canSeq.fasta.gz" , package = "prozor"))

annotAll <- prozor::annotatePeptides(upeptide, resAll)
head(subset(annotAll,select =  -proteinSequence))
annotCan <- prozor::annotatePeptides(upeptide, resCan)
barplot(c(All = length(resAll),Canonical = length(resCan)))

## ----fig.cap="Number of unique peptide protein pairs  for the All and Canonical database."----
barplot(c(All = nrow(annotAll), Canonical = nrow(annotCan)), ylab = "# peptide protein matches.")

## -----------------------------------------------------------------------------
PCProteotypic_all <-
    sum(table(annotAll$peptideSeq) == 1) / length(table(annotAll$peptideSeq)) * 100
PCProteotypic_canonical <-
    sum(table(annotCan$peptideSeq) == 1) / length(table(annotCan$peptideSeq)) * 100

barplot(
    c(All = PCProteotypic_all, Canonical =  PCProteotypic_canonical),
    las = 2,
    ylab = "% proteotypic"
)


## -----------------------------------------------------------------------------
library(Matrix)
precursors <-
    unique(subset(specMeta, select = c(
        peptideModSeq, precursorCharge, peptideSeq
    )))


## ----greedyTrembl, fig.cap="Peptide protein machtes for the All database. Rows - peptides, Columns - proteins, black - peptide protein match."----
library(Matrix)
annotatedPrecursors <- merge(precursors ,
                             subset(annotAll, select = c(peptideSeq, proteinID)),
                             by.x = "peptideSeq",
                             by.y = "peptideSeq")


xx <-
    prepareMatrix(annotatedPrecursors,
                  proteinID = "proteinID",
                  peptideID = "peptideSeq")

image(xx)
xxAll <- greedy(xx)


## ----greedyCanonical, fig.cap="Peptide protein machtes for the Canonical database. Rows - peptides, Columns - proteins, black - peptide protein match."----
annotatedPrecursors <-
    merge(precursors ,
          subset(annotCan, select = c(peptideSeq, proteinID)),
          by.x = "peptideSeq",
          by.y = "peptideSeq")


xx <-
    prepareMatrix(annotatedPrecursors ,
                  proteinID = "proteinID",
                  peptideID = "peptideSeq")
image(xx)
xxCAN <- greedy(xx)


## ----fig.cap="Number of proteins before and after protein inference."---------
barplot(c(All_before = length(unique(annotAll$proteinID)), All_after = length(unique(unlist(
    xxAll
))) , Canonical_before =  length(unique(annotCan$proteinID)), Canonical_after = length(unique(unlist(
    xxCAN
)))))


## -----------------------------------------------------------------------------
sessionInfo()

