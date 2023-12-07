library(readxl)
library(tidyverse)
library(lubridate)
library(openxlsx)
library(tools)
library(DBI)
library(janitor)

#-------------------------------------------------------------------------------
# Script for reading NHSE diagnostic demand and capacity template, wrangling
# and outputting a flattened version for analysis.
#-------------------------------------------------------------------------------

# set filepath and get filename
fpath <- file.choose()

fname <- basename(fpath)

# load the D&C dashboard
# look into whether you can read the max row and column
source_data <- read_excel(fpath, 
                                        sheet = "3. Asset Register", range = "B7:W507")

# add to data frame and clean column names
data <- data.frame(source_data)

data <- clean_names(data)

# cut off end rows or rows without equipment
nas <- which(is.na(data[,2])) # find null local equipment identifier
data <- data %>%  filter(!row_number() %in% nas)

# set up database connection
constring <- Sys.getenv("SANDPIT")
con <- dbConnect(odbc::odbc()
                 , .connection_string = constring
)

# get provider name to write to global temp table
tname <- substr(fname, 1, 4)
tname <- paste0("##",tname)

drop_table <- 
  paste0("DROP TABLE IF EXISTS ",tname)

# run query
dbGetQuery(con, drop_table)
print("SQL query complete.")

# write the table
dbWriteTable(con, tname, data)
