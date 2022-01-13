VEC <- function(log_data){

    library(tsDyn)
    library(urca)
    library(vars)
    library(tseries)
    library(tidyverse)
    library(stargazer)

    # creating time series objects
    log_QDP <- ts(log_data$log_QDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDP <- ts(log_data$log_PREALWAPDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDNP <- ts(log_data$log_PREALWAPDNP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_YDISPREAL <- ts(log_data$log_YDISPREAL, start=c(2012, 1), end=c(2020, 3), frequency=12)

    datavec <- cbind(log_QDP,log_PREALWAPDP, log_PREALWAPDNP, log_YDISPREAL)

    vecm <- VECM(datavec, 9, r=1, estim=("2OLS"))

    vecm
}