# how to install and test dev version of bcc (github)
library(devtools)
devtools::install_github("DanieLucas28/BCCPackage")
library(bcc)
data("Montgomery2005")
bcc(data=Montgomery2005$Defective, sizes=Montgomery2005$Sample, type=1)

