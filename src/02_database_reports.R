# Create Student MIS reports from the SQLite database.
source("requirements.R")
dir.create("outputs", showWarnings = FALSE)

con <- DBI::dbConnect(RSQLite::SQLite(), "data/student_mis.sqlite")
on.exit(DBI::dbDisconnect(con), add = TRUE)

department_summary <- DBI::dbGetQuery(con, "
  SELECT department,
         COUNT(*) AS student_count,
         ROUND(AVG(marks), 2) AS average_marks,
         ROUND(AVG(attendance_pct), 2) AS average_attendance
  FROM students
  GROUP BY department
  ORDER BY department;
")

students_needing_attention <- DBI::dbGetQuery(con, "
  SELECT student_id, student_name, department, marks, attendance_pct
  FROM students
  WHERE marks < 50 OR attendance_pct < 75
  ORDER BY marks, attendance_pct;
")

readr::write_csv(department_summary, "outputs/department_summary.csv")
readr::write_csv(students_needing_attention, "outputs/students_needing_attention.csv")
print(department_summary)
print(students_needing_attention)

