# FEZF1-GGAA-inside-gene

Search for (GGAA)n microsatellites inside selected genes

Executed in RStudio Version 1.4.1717 with R version 4.1.1

INPUT files: gene dataset; repeats dataset

OUTPUT tables: all formated GGAA repeats; genes with a GGAA repeat.

### INSTALL LIBRARY PACKAGES AT THE BEGINNING OF R (only first time)

# install bioMart for bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("biomaRt")

# install tidyverse
install.packages("tidyverse")

# install valr for bed_merge()
install.packages("valr")

# update R
install.packages("installr", dependencies = TRUE)
library(installr)
updateR()
