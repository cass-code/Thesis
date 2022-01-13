diagnostic <- function(log_data){
  
  library(tsDyn)
  library(urca)
  library(vars)
  library(tseries)
  library(tidyverse)
  
  # creating time series objects
  log_QDP <- ts(log_data$log_QDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
  log_PREALWAPDP <- ts(log_data$log_PREALWAPDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
  log_PREALWAPDNP <- ts(log_data$log_PREALWAPDNP, start=c(2012, 1), end=c(2020, 3), frequency=12)
  log_YDISPREAL <- ts(log_data$log_YDISPREAL, start=c(2012, 1), end=c(2020, 3), frequency=12)
  
  datavec <- cbind(log_QDP,log_PREALWAPDP, log_PREALWAPDNP, log_YDISPREAL)
  cjtest1 <- ca.jo(datavec, type="trace", ecdet = "none", K=9)
  vecvar <- vec2var(cjtest1, r=1)
  
  serial1 <- serial.test(vecvar, lags.pt = 10)
  serial2 <- serial1[[2]]
  serial3 <- serial2[3]
  serial4 <- serial3[[1]]
  
  p_value <- c(serial4)
  Test <- c('Portmanteau')
  diagnostics <- data.frame(Test, p_value) %>% mutate(Test_result = ifelse(p_value <= 0.05, "Reject Null", "Fail to reject Null")) %>%
    mutate(Interpretation = ifelse(p_value > 0.05, "No Autocorrelation", "Autorrelation")) %>% rename("p value" = p_value, "Test Result" = Test_result)
  diagnostics

}