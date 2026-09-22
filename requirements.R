# Install required packages for the Student MIS project.
packages <- c("readr", "dplyr", "DBI", "RSQLite", "ggplot2", "janitor")
missing_packages <- packages[!packages %in% rownames(installed.packages())]

if (length(missing_packages) > 0) {
  install.packages(missing_packages, repos = "https://cloud.r-project.org")
}

invisible(lapply(packages, library, character.only = TRUE))

