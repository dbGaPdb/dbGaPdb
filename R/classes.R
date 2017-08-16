#' Interact with dbGaPdb
#'
#' @importClassesFrom RSQLite SQLiteConnection
#'
setRefClass('dbGaPdb',
  fields = list(sra_attached="logical",
      .connection = "SQLiteConnection"),
  methods = list(
      connect = function(path) {
          "Connect to the database
          This is a test"
          .connection <<- dbConnect(SQLite(), path)
      },
      attachSRA = function(path) {
          dbSendQuery(.connection, sprintf("attach '%s' as sra", path))
          self$sra_attached = TRUE
      },
      tables = function() {
          dbListTables(.connection)
      },
      dplyr_tables = function() {
          tblnames = .self$tables()
          dpt = lapply(.self$tables(),function(x) tbl(src = .connection,x))
          names(dpt) = tblnames
          dpt
      }
      ))


