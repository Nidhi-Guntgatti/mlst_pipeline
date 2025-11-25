MLST Pipeline Documentation

Overview:
This repository contains analysis scripts and documentation for performing MLST (Multilocus Sequence Typing) and International Clone (IC) classification for Acinetobacter baumannii isolates.

Repository Structure:
mlst_pipeline/


1. scripts/
   
      mlst_st_analysis.R;
   
      mlst_ic_analysis.R
3. documentation/
   
      mlst_st_analysis_documentation.pdf;
   
      mlst_ic_analysis_documentation.pdf

Scripts:
1. mlst_st_analysis.R
- Performs ST (Sequence Type) distribution analysis.
- Generates:
  
       ST_distribution.csv;
       ST_distribution_barplot.png;
       Allele_variation_summary.csv
2. mlst_ic_analysis.R
- Assigns International Clones (IC1–IC9) based on ST values.
- Generates:
  
       MLST_with_IC.csv;
       IC_distribution.csv

Requirements:
R packages required:

          a. dplyr
          b. readr
          c. tidyr
          d. ggplot2
          
How to Run:

source("scripts/mlst_st_analysis.R");

source("scripts/mlst_ic_analysis.R")

Author:
Nidhi Guntgatti
