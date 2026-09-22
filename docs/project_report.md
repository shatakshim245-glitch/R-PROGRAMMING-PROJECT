# Student MIS Data Import and Database Reporting

## Objective

To demonstrate importing Student MIS records into R, validating the data, storing it in an SQLite database, and generating reports for academic monitoring.

## Method

1. A fictional student dataset is read from CSV using `readr`.
2. Column names and text fields are cleaned with `janitor` and base R functions.
3. Validation prevents duplicate student IDs and out-of-range year, marks, or attendance values.
4. Clean records are saved in a local SQLite `students` table using `DBI` and `RSQLite`.
5. SQL queries create department summaries and identify students needing attention.
6. `ggplot2` creates a chart of average marks by department.

## Findings from the sample data

Computer Science has the highest average marks (82.67). Three students require attention because their attendance is below 75% and/or marks are below 50. These reports help a guide or faculty member identify areas for follow-up.

## Data ethics

The CSV contains fictional records created solely for this academic demonstration. Do not upload real student data without authorization and appropriate privacy safeguards.

