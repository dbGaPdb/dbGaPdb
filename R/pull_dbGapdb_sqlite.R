#' Downloads dbGaPdb sqlite from temp link and unzips it
#'
#' @import R.utils
#' @export
pull_dbGaPdb_sqlite <- function(local_path=tempdir(),
                                sqlite_db_name='dbGaPdb.sqlite',
                                link='https://helix.nih.gov/~mcgaugheyd/dbGapdb_2017-08-16.sqlite.gz'){
  path_and_file <- file.path(local_path, sqlite_db_name)
  path_and_file_gz <- paste0(path_and_file,'.gz')
  download.file(link, path_and_file_gz)
  message('Downloaded, now unzipping')
  R.utils::gunzip(path_and_file_gz,overwrite=TRUE)
  return(path_and_file)
}
