# Plot average marks by department from the MIS report.
source("requirements.R")
dir.create("outputs", showWarnings = FALSE)

summary_data <- readr::read_csv("outputs/department_summary.csv", show_col_types = FALSE)
chart <- ggplot2::ggplot(summary_data, ggplot2::aes(x = reorder(department, average_marks), y = average_marks)) +
  ggplot2::geom_col(fill = "#2C7FB8") +
  ggplot2::coord_flip() +
  ggplot2::labs(
    title = "Average Marks by Department",
    x = "Department", y = "Average marks (out of 100)"
  ) +
  ggplot2::theme_minimal()

ggplot2::ggsave("outputs/average_marks_by_department.png", chart, width = 8, height = 5, dpi = 150)

