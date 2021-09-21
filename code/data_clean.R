data_clean <- function(data){

    library(tidyverse)
    library(dplyr)

    # selecting the data and logging the variables then slicing off the top 99 values for the sample period
    log_data <- data %>% dplyr::select(DATE, QTOT, QDP, PREALWAPDP, PREALWAPDNP, YDISPREAL) %>%
        mutate(log_QTOT = log(QTOT), log_QDP = log(QDP), log_PREALWAPDP = log(PREALWAPDP), log_PREALWAPDNP = log(PREALWAPDNP), log_YDISPREAL = log(YDISPREAL)) %>%
        slice_head(n=99)

    # return logged data set
    log_data
}