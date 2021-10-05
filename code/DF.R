DF <- function(log_data) {

  library(tsm)
  library(vars)
  library(mFilter)
  library(dplyr)

  QDP_ADF <- ur.adf(log_data$log_QDP, type = "trend", selectlags = "AIC")
  summary(QDP_ADF)

  PREALWAPDP_ADF <- ur.adf(log_data$log_PREALWAPDP, type = "trend", selectlags = "AIC")

  PREALWAPDNP_ACF <- ur.adf(log_data$log_PREALWAPDNP, type = "trend", selectlags = "AIC")

  YDISPREAL_ACF <- ur.adf(log_data$log_YDISPREAL, type = "trend", selectlags = "AIC")

}