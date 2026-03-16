# 03_fibroblast_monocle3.R
# Purpose:
# Perform Monocle3 trajectory and pseudotime analysis
# for fibroblast cells.

library(monocle3)
library(dplyr)

setwd("~")

# -----------------------------
# 1. Load input files
# -----------------------------
counts <- readRDS("fibroblast_counts_matrix.rds")
cell_metadata <- readRDS("fibroblast_metadata.rds")

# Create gene annotation
gene_annotation <- data.frame(
  gene_short_name = rownames(counts),
  row.names = rownames(counts)
)

# -----------------------------
# 2. Create Monocle3 object
# -----------------------------
cds_fib <- new_cell_data_set(
  counts,
  cell_metadata = cell_metadata,
  gene_metadata = gene_annotation
)

# -----------------------------
# 3. Preprocess and learn trajectory
# -----------------------------
cds_fib <- preprocess_cds(cds_fib)
cds_fib <- reduce_dimension(cds_fib)
cds_fib <- cluster_cells(cds_fib)
cds_fib <- learn_graph(cds_fib)

# -----------------------------
# 4. Order cells in pseudotime
# -----------------------------
# Fibroblast subset corresponds to Seurat cluster 11
root_cells <- colnames(cds_fib)[colData(cds_fib)$seurat_clusters == "11"]

cds_fib <- order_cells(cds_fib, root_cells = root_cells)

# Save Monocle object
saveRDS(cds_fib, "cds_fib.rds")

# -----------------------------
# 5. Save trajectory plot
# -----------------------------
pdf("fibroblast_trajectory.pdf", width = 8, height = 6)

plot_cells(
  cds_fib,
  color_cells_by = "pseudotime",
  show_trajectory_graph = TRUE,
  label_leaves = FALSE,
  label_branch_points = TRUE
)

dev.off()

# -----------------------------
# 6. Identify pseudotime-associated genes
# -----------------------------
deg_fib <- graph_test(cds_fib, neighbor_graph = "principal_graph")

saveRDS(deg_fib, "fibroblast_graph_test_results.rds")

# Keep significant genes
sig_fib <- deg_fib %>%
  filter(q_value < 0.05)

# Save significant gene table
write.csv(sig_fib, "fibroblast_significant_pseudotime_genes.csv", row.names = TRUE)

# -----------------------------
# 7. Extract top 300 dynamic genes
# -----------------------------
top_fib <- sig_fib %>%
  arrange(desc(morans_I)) %>%
  head(300)

top_fib_genes <- top_fib$gene_short_name

write.table(
  top_fib_genes,
  "fibroblast_top300_pseudotime.txt",
  quote = FALSE,
  row.names = FALSE,
  col.names = FALSE
)

# -----------------------------
# 8. Save pseudotime values
# -----------------------------
pt <- pseudotime(cds_fib)

write.csv(
  data.frame(cell = names(pt), pseudotime = pt),
  "fibroblast_pseudotime_values.csv",
  row.names = FALSE
)