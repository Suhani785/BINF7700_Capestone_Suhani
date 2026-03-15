# 05_project_summary.R
# Purpose:
# Summarize key analysis outputs from the project,
# including pseudotime gene counts, shared/unique genes,
# and files used for functional enrichment and network analysis.

setwd("~")

# -----------------------------
# 1. Load gene lists
# -----------------------------
mes_top300 <- scan("mesenchymal_top300_pseudotime.txt", what = "character")
fib_top300 <- scan("fibroblast_top300_pseudotime.txt", what = "character")
shared_genes <- scan("shared_top300_genes.txt", what = "character")
mes_unique <- scan("mesenchymal_unique_genes.txt", what = "character")
fib_unique <- scan("fibroblast_unique_genes.txt", what = "character")

# -----------------------------
# 2. Summarize counts
# -----------------------------
summary_table <- data.frame(
  Category = c(
    "Mesenchymal pseudotime genes",
    "Fibroblast pseudotime genes",
    "Shared genes",
    "Mesenchymal unique genes",
    "Fibroblast unique genes"
  ),
  Count = c(
    length(mes_top300),
    length(fib_top300),
    length(shared_genes),
    length(mes_unique),
    length(fib_unique)
  )
)

print(summary_table)

write.csv(summary_table, "project_summary_counts.csv", row.names = FALSE)

# -----------------------------
# 3. Record downstream analyses
# -----------------------------
downstream_analysis_notes <- c(
  "PANTHER GO enrichment was performed using:",
  "- mesenchymal_unique_genes.txt",
  "- fibroblast_unique_genes.txt",
  "- shared_top300_genes.txt",
  "",
  "STRING protein interaction network analysis was performed using:",
  "- shared_top300_genes.txt",
  "",
  "Generated key outputs include:",
  "- cluster_umap.pdf",
  "- cluster_avg_expression.pdf",
  "- mesenchymal_trajectory.pdf",
  "- fibroblast_trajectory.pdf",
  "- pseudotime_gene_venn_diagram.pdf",
  "- STRING network image",
  "- PANTHER enrichment result tables"
)

writeLines(downstream_analysis_notes, "project_analysis_notes.txt")

# -----------------------------
# 4. Save final interpreted summary
# -----------------------------
final_summary <- data.frame(
  Analysis = c(
    "Cell clustering",
    "Mesenchymal trajectory",
    "Fibroblast trajectory",
    "Gene overlap analysis",
    "GO enrichment",
    "STRING network"
  ),
  Main_Result = c(
    "Identified transcriptionally distinct stromal clusters",
    "Modeled mesenchymal pseudotime progression",
    "Modeled fibroblast pseudotime progression",
    "210 shared genes; 90 unique genes for each population",
    "Mesenchymal genes enriched for RNA regulation; fibroblast genes enriched for ECM organization",
    "Shared genes formed translation, ECM, and cytoskeletal modules"
  )
)

print(final_summary)

write.csv(final_summary, "final_project_summary.csv", row.names = FALSE)
