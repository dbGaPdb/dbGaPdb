# Introduction
The Database of Genotypes and Phenotypes (dbGaP) at
    the NCBI contains public and controlled access metadata about
    studies involving human subjects. It is also the entry point
    for accessing genomic data for study subjects (after obtaining
    appropriate access). This package facilitates mining of metadata
    in dbGaP and related genomic data by parsing all the open access
    metadata into a relational database. Enhanced searching, data
    summaries, text mining, and metadata enhancement (via mapping
    to ontologies) are just a few potential applications.

# Install
```{r]
# install.packages(devtools)
devtools::install_github(repo = 'dbGaPdb/dbGaPdb')
```

# Quick Start
```{r}
library(dbGaPdb)
library(dbplyr)
library(dplyr)

dbGaPdb_file <- pull_dbGaPdb_sqlite(local_path = '~/')
dbGaPdb <- src_sqlite(dbGaPdb_file)
dbGaPdb
tbl(dbGaPdb, 'study_info') %>% select(this_study_accession, name) %>% head(20)
```

# Quick Start (Folks more comfortable with SQL)
```{r}
library(dbGaPdb)
library(RSQLite)

dbGaPdb_file <- pull_dbGaPdb_sqlite(local_path = '~/')
con <- dbConnect(SQLite(), dbGaPdb_file)
dbListTables(con)
dbGetQuery(con, 'SELECT this_study_accession, name FROM study_info LIMIT 20')
```


