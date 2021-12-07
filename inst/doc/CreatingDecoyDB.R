## -----------------------------------------------------------------------------
library(prozor)
head(names(loadContaminantsFasta2021()))
length(loadContaminantsFasta2021())
length(loadContaminantsFasta2021(noHuman = TRUE))


## -----------------------------------------------------------------------------
databasedirectory = system.file("p1000_db1_example",package = "prozor")
#databasedirectory <- file.path(find.package("prozor"), "p1000_db1_example")
dbname <- basename(databasedirectory)
fasta <- grep("fasta", dir(databasedirectory),value = TRUE)
files1 <- file.path(databasedirectory,fasta)
annot <- grep("annotation",dir(databasedirectory), value = TRUE)
annotation <- readLines(file.path(databasedirectory,annot))
annotation


## -----------------------------------------------------------------------------
resDB <- createDecoyDB(files1, useContaminants = loadContaminantsFasta2021(),
                       annot = annotation, revLab = NULL)
length(resDB)


## -----------------------------------------------------------------------------
dirname(databasedirectory)
xx <- file.path(dirname(databasedirectory), paste(dbname,"_",format(Sys.time(), "%Y%m%d"),".fasta" ,sep = ""))
print(xx)


## ----eval=FALSE---------------------------------------------------------------
#  writeFasta(resDB, file=xx)
#  

## -----------------------------------------------------------------------------
resDBDecoy <- createDecoyDB(files1,
                            useContaminants = loadContaminantsFasta2021(),
                            annot = annotation,
                            revLab = "REV_")

resDBDecoy[[length(resDBDecoy) - 1]]
length(resDBDecoy)

sum(duplicated(names(resDBDecoy)))
sum(duplicated(resDBDecoy))

dbname_decoy <- unlist(strsplit(dbname,"_"))
dbname_decoy <- paste(c(dbname_decoy[1],"d",dbname_decoy[2:length(dbname_decoy)]),collapse = "_")
dbname_decoy

xx <- file.path(dirname(databasedirectory), paste(dbname_decoy,"_",format(Sys.time(), "%Y%m%d"),".fasta" ,sep = ""))
print(xx)


## ----eval=FALSE---------------------------------------------------------------
#  writeFasta(resDBDecoy, file = xx)

## -----------------------------------------------------------------------------
sessionInfo()

