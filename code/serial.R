serial <- function(log_data, maxlag){

    library(tsm)
    library(vars)
    library(tseries)
    library(tidyverse)
    library(stargazer)

maxlag <- 10
    # creating time series objects
    log_QDP <- ts(log_data$log_QDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDP <- ts(log_data$log_PREALWAPDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDNP <- ts(log_data$log_PREALWAPDNP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_YDISPREAL <- ts(log_data$log_YDISPREAL, start=c(2012, 1), end=c(2020, 3), frequency=12)

    bind <- cbind(log_QDP,log_PREALWAPDP, log_PREALWAPDNP, log_YDISPREAL)
    colnames(bind) <- cbind("Quantity", "Price Duties Paid", "Price Duties not Paid", "Disposable Income")

    model <- VAR(bind, p = maxlag, type = "const", season = NULL, exogen = NULL)
    s <- serial.test(model, lags.pt=maxlag, type = "PT.asymptotic")
    s

   # null hypothesis of no autocorrelation
}