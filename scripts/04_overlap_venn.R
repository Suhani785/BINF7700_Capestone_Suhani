# 04_gene_overlap_venn.R
# Purpose:
# Compare mesenchymal and fibroblast pseudotime-associated genes,
# identify shared and unique gene sets, and generate a Venn diagram.

library(ggVennDiagram)
library(ggplot2)

setwd("~")

# -----------------------------
# 1. Load top 300 pseudotime genes
# -----------------------------
mes <- scan("mesenchymal_top300_pseudotime.txt", what = "character")
fib <- scan("fibroblast_top300_pseudotime.txt", what = "character")

# -----------------------------
# 2. Identify shared and unique genes
# -----------------------------
shared_genes <- intersect(mes, fib)
mes_unique <- setdiff(mes, fib)
fib_unique <- setdiff(fib, mes)

# -----------------------------
# 3. Save gene lists
# -----------------------------
write.table(
  shared_genes,
  "shared_top300_genes.txt",
  quote = FALSE,
  row.names = FALSE,
  col.names = FALSE
)

write.table(
  mes_unique,
  "mesenchymal_unique_genes.txt",
  quote = FALSE,
  row.names = FALSE,
  col.names = FALSE
)

write.table(
  fib_unique,
  "fibroblast_unique_genes.txt",
  quote = FALSE,
  row.names = FALSE,
  col.names = FALSE
)

# -----------------------------
# 4. Print counts to console
# -----------------------------
cat("Mesenchymal top300 genes:", length(mes), "\n")
cat("Fibroblast top300 genes:", length(fib), "\n")
cat("Shared genes:", length(shared_genes), "\n")
cat("Mesenchymal unique genes:", length(mes_unique), "\n")
cat("Fibroblast unique genes:", length(fib_unique), "\n")

# -----------------------------
# 5. Generate Venn diagram
# -----------------------------
gene_lists <- list(
  Mesenchymal = mes,
  Fibroblast = fib
)

venn_plot <- ggVennDiagram(
  gene_lists,
  label_alpha = 0,
  label = "count"
) +
  scale_fill_gradient(low = "#E3F2FD", high = "#1565C0") +
  theme_void()

# Save as PDF
ggsave(
  "pseudotime_gene_venn_diagram.pdf",
  venn_plot,
  width = 6,
  height = 6
)

# Optional: save PNG preview for GitHub
ggsave(
  "pseudotime_gene_venn_diagram.png",
  venn_plot,
  width = 6,
  height = 6,
  dpi = 300
)
