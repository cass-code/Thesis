DF <- function(log_data) {
  
  library(tsm)
  library(vars)
  library(mFilter)
  library(dplyr)
  
  QDP_ADF <- ur.df(log_data$log_QDP, type = "trend", selectlags = "AIC")
  summary(adf.une)
  
  PREALWAPDP_ADF <- ur.df(log_data$log_PREALWAPDP, type = "trend", selectlags = "AIC")
  
  PREALWAPDNP_ACF <- ur.df(log_data$log_PREALWAPDNP, type = "trend", selectlags = "AIC")
  
  YDISPREAL_ACF <- ur.df(log_data$log_YDISPREAL, type = "trend", selectlags = "AIC")
  
}