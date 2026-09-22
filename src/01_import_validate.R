# Import, validate, and load Student MIS records into SQLite.
source("requirements.R")

input_file <- "data/student_mis_sample.csv"
database_file <- "data/student_mis.sqlite"

students <- readr::read_csv(input_file, show_col_types = FALSE) |>
  janitor::clean_names() |>
  dplyr::mutate(
    student_id = trimws(student_id),
    student_name = trimws(student_name),
    department = trimws(department),
    year = as.integer(year),
    attendance_pct = as.numeric(attendance_pct),
    marks = as.numeric(marks)
  )

required_columns <- c("student_id", "student_name", "gender", "department", "year",
                      "attendance_pct", "marks", "fee_status")
stopifnot(all(required_columns %in% names(students)))
stopifnot(!anyDuplicated(students$student_id))
stopifnot(all(students$year >= 1 & students$year <= 6))
stopifnot(all(students$attendance_pct >= 0 & students$attendance_pct <= 100))
stopifnot(all(students$marks >= 0 & students$marks <= 100))

con <- DBI::dbConnect(RSQLite::SQLite(), database_file)
on.exit(DBI::dbDisconnect(con), add = TRUE)
DBI::dbWriteTable(con, "students", students, overwrite = TRUE)

message("Imported ", nrow(students), " validated student records into ", database_file)

