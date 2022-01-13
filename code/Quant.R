Quant <- function(log_data, maxlag){
  
  # Setting up Var
  
  # loading required packages
  library(tsm)
  library(urca)
  library(vars)
  library(tseries)
  library(tidyverse)
  library(stargazer)
  library(astsa)
  
  # creating time series objects
  log_QDP <- ts(log_data$log_QDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
  log_PREALWAPDP <- ts(log_data$log_PREALWAPDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
  log_PREALWAPDNP <- ts(log_data$log_PREALWAPDNP, start=c(2012, 1), end=c(2020, 3), frequency=12)
  log_YDISPREAL <- ts(log_data$log_YDISPREAL, start=c(2012, 1), end=c(2020, 3), frequency=12)
  bind <- cbind(log_QDP,log_PREALWAPDP, log_PREALWAPDNP, log_YDISPREAL)
  colnames(bind) <- cbind("Quantity", "Price Duties Paid", "Price Duties not Paid", "Disposable Income")

  model <- vars::VAR(bind, p = 9, type = 'const', season = NULL, exogen = NULL)
  m <- model[[1]]
  m
}
