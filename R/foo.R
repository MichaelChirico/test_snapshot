foo <- function() {
  farsi = data.table::fread(
    system.file('language_metadata.csv', package="testSnapshot"),
    encoding="UTF-8",
     select="full_name_native")[[1]][8L]
  message(farsi)
  writeLines(
    readLines(system.file('input', package='testSnapshot'), encoding="UTF-8"),
    useBytes = TRUE
  )
}
