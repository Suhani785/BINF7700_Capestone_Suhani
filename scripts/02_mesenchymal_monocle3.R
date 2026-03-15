# 02_mesenchymal_monocle3.R
# Purpose:
# Perform Monocle3 trajectory and pseudotime analysis
# for mesenchymal progenitor-like cells.

library(monocle3)
library(dplyr)

setwd("~")

# -----------------------------
# 1. Load input files
# -----------------------------
counts <- readRDS("mesenchymal_counts_matrix.rds")
cell_metadata <- readRDS("mesenchymal_metadata.rds")

# Create gene annotation
gene_annotation <- data.frame(
  gene_short_name = rownames(counts),
  row.names = rownames(counts)
)

# -----------------------------
# 2. Create Monocle3 object
# -----------------------------
cds_mes <- new_cell_data_set(
  counts,
  cell_metadata = cell_metadata,
  gene_metadata = gene_annotation
)

# -----------------------------
# 3. Preprocess and learn trajectory
# -----------------------------
cds_mes <- preprocess_cds(cds_mes)
cds_mes <- reduce_dimension(cds_mes)
cds_mes <- cluster_cells(cds_mes)
cds_mes <- learn_graph(cds_mes)

# -----------------------------
# 4. Order cells in pseudotime
# -----------------------------
# Mesenchymal subset contains one seurat cluster level: "1"
root_cells <- colnames(cds_mes)[colData(cds_mes)$seurat_clusters == "1"]

cds_mes <- order_cells(cds_mes, root_cells = root_cells)

# Save Monocle object
saveRDS(cds_mes, "cds_mes.rds")

# -----------------------------
# 5. Save trajectory plot
# -----------------------------
pdf("mesenchymal_trajectory.pdf", width = 8, height = 6)

plot_cells(
  cds_mes,
  color_cells_by = "pseudotime",
  show_trajectory_graph = TRUE,
  label_leaves = FALSE,
  label_branch_points = TRUE
)

dev.off()

# -----------------------------
# 6. Identify pseudotime-associated genes
# -----------------------------
deg_pseudotime <- graph_test(cds_mes, neighbor_graph = "principal_graph")

saveRDS(deg_pseudotime, "mesenchymal_graph_test_results.rds")

# Keep significant genes
sig_genes <- deg_pseudotime %>%
  filter(q_value < 0.05)

# Save significant gene table
write.csv(sig_genes, "mesenchymal_significant_pseudotime_genes.csv", row.names = TRUE)

# -----------------------------
# 7. Extract top 300 dynamic genes
# -----------------------------
top_dynamic <- sig_genes %>%
  arrange(desc(morans_I)) %>%
  head(300)

top_dynamic_genes <- top_dynamic$gene_short_name

write.table(
  top_dynamic_genes,
  "mesenchymal_top300_pseudotime.txt",
  quote = FALSE,
  row.names = FALSE,
  col.names = FALSE
)

# -----------------------------
# 8. Optional: save pseudotime values
# -----------------------------
pt <- pseudotime(cds_mes)

write.csv(
  data.frame(cell = names(pt), pseudotime = pt),
  "mesenchymal_pseudotime_values.csv",
  row.names = FALSE
)
