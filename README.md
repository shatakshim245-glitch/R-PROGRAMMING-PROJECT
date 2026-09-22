# Student MIS: Data Import and Database Reporting in R

This project demonstrates a small Student Management Information System (MIS) workflow in R. It imports student records from a CSV file, validates and cleans the data, stores the records in a local SQLite database, and produces department-level summaries and visualisations.

## Project structure

```
data/       Input dataset
src/        R scripts for importing, reporting, and charts
outputs/    Example report files generated from the sample dataset
docs/       Project documentation
```

## Requirements

- R 4.2 or later
- Packages listed in `requirements.R`

Install packages once with:

```r
source("requirements.R")
```

## How to run

From the project root, run the scripts in order:

```r
source("src/01_import_validate.R")
source("src/02_database_reports.R")
source("src/03_visualize.R")
```

The first script creates `data/student_mis.sqlite`. The report and chart scripts save results under `outputs/`.

## Dataset fields

`student_id`, `student_name`, `gender`, `department`, `year`, `attendance_pct`, `marks`, and `fee_status` are included. The dataset contains fictional sample records only and no personal data.

## Expected results

- Clean, validated student records in a SQLite database
- Department-wise student count, average marks, and average attendance
- List of students who need academic attention (marks below 50 or attendance below 75%)
- Bar chart of average marks by department

See [docs/project_report.md](docs/project_report.md) for methodology and interpretation.

