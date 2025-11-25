library(dplyr)
library(readr)

# ===== INPUT FILE =====
input_file <- "/data/internship_data/nidhi/aba/output/mlst_output/mlst_results.csv"

# Read without headers
mlst <- read_csv(input_file, col_names = FALSE)

# Assign minimal required column names
colnames(mlst) <- c(
  "file", "species", "ST",
  "cpn60", "fusA", "gltA", "pyrG", "recA", "rplB", "rpoB"
)

# Convert ST to character
mlst$ST <- as.character(mlst$ST)

# ===== IC MAPPING TABLE =====
ic_lookup <- list(
  IC1 = c("ST1","ST10","ST20","ST81"),
  IC2 = c("ST2","ST195","ST208"),
  IC3 = c("ST3","ST145"),
  IC4 = c("ST15"),
  IC5 = c("ST25"),
  IC6 = c("ST78"),
  IC7 = c("ST79"),
  IC8 = c("ST85"),
  IC9 = c("ST158")
)

# Function to assign IC
assign_ic <- function(st_value) {
  st_label <- paste0("ST", st_value)
  for (ic in names(ic_lookup)) {
    if (st_label %in% ic_lookup[[ic]]) {
      return(ic)
    }
  }
  return("Unassigned")
}

# Assign IC to each isolate
mlst$IC <- sapply(mlst$ST, assign_ic)

# ===== OUTPUT =====
# Save annotated MLST with IC
write.csv(mlst, "MLST_with_IC.csv", row.names = FALSE)

# IC distribution summary
ic_table <- mlst %>%
  count(IC, name = "Count") %>%
  mutate(Percentage = round((Count / sum(Count)) * 100, 2))

write.csv(ic_table, "IC_distribution.csv", row.names = FALSE)

cat("\nIC assignment complete.\n")
cat("Generated files:\n")
cat(" - MLST_with_IC.csv\n")
cat(" - IC_distribution.csv\n")
