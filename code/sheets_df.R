sheets_df <- function(xl_data) {

    library(tidyverse)
    library(dplyr)
    library(tibble)
    library(readxl)
    a <- xl_data %>% excel_sheets() %>% set_names() %>% map(read_excel, path= xl_data)

    list2env(a, envir=.GlobalEnv) # returns every excel sheet as a tibble data frame to the global environment,
    # where the name of the dataframe is the same as the sheet name

}
