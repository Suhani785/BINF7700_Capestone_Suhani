# 01_seurat_clustering.R
# Purpose:
# Load the full Seurat object, visualize UMAP clusters,
# and generate a marker gene dot plot for stromal populations.
#
# Note:
# The full integrated Seurat object used to generate the clustering figures
# is not currently stored in this repository directory.

library(Seurat)

setwd("~")

seurat_obj <- readRDS("mesenchymal_cluster1.rds")

#
pdf("cluster_umap.pdf", width = 8, height = 6)

DimPlot(
  seurat_obj,
  reduction = "umap",
  label = TRUE,
  repel = TRUE
)

dev.off()

# Marker gene dot plot
marker_genes <- c(
  "COL1A1",
  "COL1A2",
  "LUM",
  "FBN2",
  "PDGFRA",
  "COL6A1",
  "DCN",
  "VIM",
  "ACTA2"
)

pdf("cluster_avg_expression.pdf", width = 10, height = 6)

DotPlot(
  seurat_obj,
  features = marker_genes
) + RotatedAxis()

dev.off()
