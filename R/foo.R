#' test
#'
#' should work
should_work <- function() {
  farsi = data.table::fread(
    system.file('language_metadata.csv', package="testSnapshot"),
    encoding="UTF-8",
     select="full_name_native")[[1]][8L]
  message(gettextf("%s", farsi))
}

#' test
#'
#' shouldn't work
should_fail <- function() {
  po_lines <- readLines(system.file('R-zh_CN.po', package='testSnapshot'), encoding = "UTF-8")
  line <- paste(gsub('^msgstr "|"$', "", po_lines[21L]), collapse = "")
  tmp <- tempfile()
  on.exit(unlink(tmp))
  conn <- file(tmp, "w+", encoding="native.enc")
  writeLines(gsub("", "", line), conn, useBytes = TRUE)
  close(conn)
  new_lines <- readLines(tmp, encoding = "UTF-8")
  new_line <- paste(gsub("", "", new_lines), collapse = "")
  DT <- data.table(new_line)
  writeLines(DT[[1L]])
}
