### Wanders through genes list; for each gene, wanders repeat list

genes_with_GGAA = data.frame(matrix(ncol = 9, nrow = 0)) #initialize output variable. Change if different columns are needed
colnames(genes_with_GGAA) = c("hgcn_symbol", "log2fc", "p_adj", "chr", "gene_start", "gene_end", "repeat_ID", "repeat_start", "repeat_end") #columns of interest, change if needed

counter_output = 1
for (counter1 in 1:dim(genes_dataset_all)[1]) { #wanders each gene row
  current_gene_ID = genes_dataset_all[counter1,]$hgnc_symbol #select gene to evaluate
  current_gene_log2fc = genes_dataset_all[counter1,]$log2fc
  current_gene_p_adj = genes_dataset_all[counter1,]$padj
  current_gene_chr = genes_dataset_all[counter1,]$chr #needed to compare a gene to each gene repeats
  current_gene_start = genes_dataset_all[counter1,]$start
  current_gene_end = genes_dataset_all[counter1,]$end
 
  repeats_current_chr = tandem_repeats[tandem_repeats$chr == current_gene_chr,] #subset of repeats of current gene
  if (dim(repeats_current_chr)[1] == 0) { #when a chr does not have repeats, continue to next gene
    next
  }
  selected_row = vector() #to store the selected repeat
  for (counter2 in 1:dim(repeats_current_chr)[1]) { #wanders each repeat row
    current_repeat_ID = repeats_current_chr[counter2,]$id #current repeat
    current_repeat_start = repeats_current_chr[counter2,]$start #start of current repeat
    current_repeat_end = repeats_current_chr[counter2,]$end #end of current repeat
    
    if (current_repeat_start >= current_gene_start | current_repeat_end >= current_gene_start) { #if start or end of repeat is upstream gene start
      if (current_repeat_start <= current_gene_end | current_repeat_end <= current_gene_end) { #if start or end of repeat is downstream gene end
        selected_row = c(current_gene_ID, current_gene_log2fc, current_gene_p_adj, current_gene_chr, current_gene_start, current_gene_end, current_repeat_ID, current_repeat_start, current_repeat_end)
        genes_with_GGAA[counter_output,] = selected_row
        counter_output = counter_output + 1
      }
    }
  }
}
genes_with_GGAA$log2fc = as.numeric(genes_with_GGAA$log2fc) #column as numbers
genes_with_GGAA$p_adj = as.numeric(genes_with_GGAA$p_adj) #column as numbers
genes_with_GGAA$gene_start = as.numeric(genes_with_GGAA$gene_start) #column as numbers
genes_with_GGAA$gene_end = as.numeric(genes_with_GGAA$gene_end) #column as numbers
genes_with_GGAA$repeat_start = as.numeric(genes_with_GGAA$repeat_start) #column as numbers
genes_with_GGAA$repeat_end = as.numeric(genes_with_GGAA$repeat_end) #column as numbers

print(head(genes_with_GGAA))
write_xlsx(genes_with_GGAA,"results/tables/genes_with_GGAA_AsiEFRNAseq.xlsx") #store in a txt file. CHANGE FILE TO STORE OUTPUT
