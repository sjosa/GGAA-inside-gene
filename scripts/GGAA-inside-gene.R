rm(list=ls()) #remove all variables
cat("\014") #clean window

### create folders results/tables/ and results/browser/
### modify paths in scripts to use your own data
### execute each script in the proposed order

### load libraries
library(tidyverse)
library(valr)
library(dplyr)
library(writexl)

### format databases
# load  formatted gene data: symbol, id, coordinates, strand, FC...
source("scripts/format_genes.R")
genes_dataset_all = genes_dataset

# load formated GGAA repeats data: ID, chr, start, end...
source("scripts/format_repeats.R")
tandem_repeats = all_ef1_bs

# load genes vs repeats script
source("scripts/genes_vs_repeats.R")