# Single-Cell Transcriptomic Analysis of Stromal Cells in Axolotl Limb Regeneration 

## Repository Purpose

This repository contains the computational workflow, analysis scripts, and results for a bioinformatics capstone project investigating single-cell RNA sequencing (scRNA-seq) data from axolotl limb regeneration. The project focuses on characterizing transcriptional dynamics in stromal cell populations, particularly mesenchymal progenitor-like cells and fibroblasts, to identify gene expression programs associated with cellular differentiation and functional specialization.

## Description

This project performs bioinformatics analysis of single-cell RNA sequencing (scRNA-seq) data to investigate transcriptional dynamics in stromal cell populations during axolotl limb regeneration. Using trajectory inference and pseudotime analysis, the study compares mesenchymal progenitor-like cells and fibroblasts to identify shared and population-specific gene expression programs associated with stromal cell differentiation.

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

## Key Results

### UMAP Clustering of Stromal Cell Populations
![UMAP clustering](results/cluster_umap.png)

### Mesenchymal Progenitor Trajectory
![mesenchymal trajectory](results/mesenchymal_trajectory.png)

### Fibroblast Differentiation Trajectory
![fibroblast trajectory](results/fibroblast_trajectory.png)

### Differential Expression Volcano Plot
![volcano plot](results/volcano_plot.png)

### Gene Expression Heatmap (Early vs Late)
![heatmap](results/heatmap_Early_vs_Late_FINAL.png)

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
## Tools and Software

The following tools were used in this analysis:

* **Seurat (R)** – single-cell RNA-seq data processing and clustering
* **Monocle3 (R)** – trajectory inference and pseudotime analysis
* **PANTHER** – Gene Ontology enrichment analysis
* **STRING** – protein interaction network analysis
* **R / RStudio** – statistical analysis and visualization
* **GitHub** – project version control and documentation

## Dataset

The analysis uses publicly available single-cell RNA-sequencing data related to axolotl limb regeneration.
The dataset contains stromal cell populations including mesenchymal progenitor-like cells and fibroblasts, which were analyzed to investigate transcriptional dynamics during regeneration.

## Reproducibility

To reproduce the analysis:

1. Clone the repository

```
git clone https://github.com/Suhani785/BINF7700_Capstone_Suhani.git
```

2. Open the R scripts inside the `scripts/` directory.

3. Run the analysis pipeline using R / RStudio.

4. Generated outputs will appear in the `results/` and `figures/` folders.

## References

Stuart, T. et al. (2019). Comprehensive Integration of Single-Cell Data. Cell.

Trapnell, C. et al. (2014). Pseudotime analysis of single-cell RNA-seq data reveals cell state transitions. Nature Biotechnology.

Seurat: https://satijalab.org/seurat/

Monocle3: https://cole-trapnell-lab.github.io/monocle3/

PANTHER: http://pantherdb.org/

STRING: https://string-db.org/

## Author

**Suhani Patel**
M.S. Bioinformatics
Northeastern University, Toronto

GitHub: https://github.com/Suhani785

