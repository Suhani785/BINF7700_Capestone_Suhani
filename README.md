# Single-Cell RNA-seq Analysis of Mesenchymal Progenitors and Fibroblasts

## Repository Purpose
This repository contains the computational workflow and analysis for my Capstone project focusing on single-cell RNA sequencing (scRNA-seq) data analysis. The project investigates transcriptional dynamics in stromal cell populations and explores how gene expression programs change during cellular differentiation.

## Description
Bioinformatics analysis of single-cell RNA-seq data to study transcriptional dynamics in mesenchymal progenitors and fibroblasts during axolotl limb regeneration.

## Dataset

The analysis uses publicly available single-cell RNA-sequencing data related to axolotl limb regeneration.

The dataset contains stromal cell populations including mesenchymal progenitor-like cells and fibroblasts, which were analyzed to investigate transcriptional dynamics during regeneration.

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

## Tools and Software

The following tools were used in this analysis:

* **Seurat (R)** – single-cell RNA-seq data processing and clustering
* **Monocle3 (R)** – trajectory inference and pseudotime analysis
* **PANTHER** – Gene Ontology enrichment analysis
* **STRING** – protein interaction network analysis
* **R / RStudio** – statistical analysis and visualization
* **GitHub** – project version control and documentation

## Reproducibility

To reproduce the analysis:

1. Clone the repository

```
git clone https://github.com/Suhani785/BINF7700_Capstone_Suhani.git
```

2. Open the R scripts inside the `scripts/` directory.

3. Run the analysis pipeline using R / RStudio.

4. Generated outputs will appear in the `results/` and `figures/` folders.

## Notes
This repository is a work in progress and will continue to evolve as new analyses, documentation, and project materials are added throughout the Capstone project.

## Author

**Suhani Patel**
M.S. Bioinformatics
Northeastern University, Toronto

GitHub: https://github.com/Suhani785

