# Single-Cell RNA-seq Analysis of Mesenchymal Progenitors and Fibroblasts

## Repository Purpose
This repository contains the computational workflow and analysis for my Capstone project focusing on single-cell RNA sequencing (scRNA-seq) data analysis. The project investigates transcriptional dynamics in stromal cell populations and explores how gene expression programs change during cellular differentiation.

## Description
This Capstone project analyzes single-cell RNA sequencing (scRNA-seq) data to investigate transcriptional dynamics in stromal cell populations. Specifically, the analysis compares mesenchymal progenitor-like cells and fibroblasts to understand how gene expression programs change during cellular differentiation.

The computational workflow includes clustering, trajectory inference, pseudotime analysis, gene program comparison, functional enrichment analysis, and protein interaction network analysis.

## Tools used
Key analysis tools used in this project include:

- Seurat for clustering and visualization  
- Monocle3 for trajectory and pseudotime analysis  
- PANTHER for Gene Ontology enrichment analysis  
- STRING for protein interaction network analysis  

The goal of this project is to identify shared and population-specific gene programs that contribute to stromal cell differentiation and functional specialization.

## Workflow
1. Data preprocessing and quality control  
2. Cell clustering and visualization  
3. Identification of stromal cell populations  
4. Trajectory inference using Monocle3  
5. Identification of dynamic pseudotime genes  
6. Gene Ontology enrichment analysis  
7. Protein interaction network analysis  
8. Comparative analysis of shared and unique gene programs  

## Key Results
### UMAP Clustering of Stromal Cell Populations
[View UMAP clustering](results/cluster_umap.pdf)

### Mesenchymal Progenitor Trajectory
[View mesenchymal trajectory](results/mesenchymal_trajectory.pdf)

### Fibroblast Differentiation Trajectory
[View fibroblast trajectory](results/fibroblast_trajectory.pdf)

### Differential Expression Volcano Plot
[View volcano plot](results/volcano_plot.pdf)

### Gene Expression Heatmap (Early vs Late)
[View heatmap](results/heatmap_Early_vs_Late_FINAL.pdf)

## Project Structure

```
BINF7700_Capstone_Suhani
│
├── data
│   ├── fibroblast_top300_pseudotime.txt
│   ├── fibroblast_unique_genes.txt
│   ├── mesenchymal_top300_pseudotime.txt
│   ├── mesenchymal_unique_genes.txt
│   └── shared_top300_genes.txt
│
├── docs
│   ├── axolotl_research_proposal.pdf
│   └── axolotl_project_timeline
│
├── figures
│   ├── GLI2_featureplot.pdf
│   ├── GZMA_featureplot.pdf
│   ├── PROM1_featureplot.pdf
│   └── cluster_labels.pdf
│
├── results
│   ├── cluster_umap.pdf
│   ├── mesenchymal_trajectory.pdf
│   ├── fibroblast_trajectory.pdf
│   ├── volcano_plot.pdf
│   ├── heatmap_Early_vs_Late_FINAL.pdf
│   ├── heatmap_top20.pdf
│   └── mesenchymal_markers.pdf
│
├── scripts
│   ├── trajectory_analysis.R
│   ├── pseudotime_analysis.R
│   └── venn_analysis.R
│
└── README.md
```  
## Analysis Workflow

The computational analysis pipeline used in this project follows these main steps:

1. **Data preprocessing and quality control** of single-cell RNA sequencing data
2. **Cell clustering and visualization** using Seurat
3. **Identification of stromal populations** including mesenchymal progenitor-like cells and fibroblasts
4. **Trajectory inference and pseudotime analysis** using Monocle3
5. **Identification of dynamically expressed pseudotime genes**
6. **Comparative analysis of gene programs** between mesenchymal progenitors and fibroblasts
7. **Functional enrichment analysis** using Gene Ontology (PANTHER)
8. **Protein interaction network analysis** using STRING
9. **Visualization of results** including UMAP plots, trajectories, heatmaps, and volcano plots

## Notes
This repository is a work in progress and will continue to evolve as new analyses, documentation, and project materials are added throughout the Capstone project.

## Author
Suhani Patel  
M.S. Bioinformatics, Northeastern University (Toronto)

