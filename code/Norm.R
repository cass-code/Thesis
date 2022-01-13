Norm <- function(log_data){
  
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
  
  
  norm <- normality.test(vecvar, multivariate.only = TRUE)
  norm
  
  norm1 <- norm[[2]] 
  norm2 <- norm1[[3]]
  norm3 <- norm2[[3]]
  
  p_value <- c(norm3)
  Test <- c('Normality')
  normm <- data.frame(Test, p_value) %>% mutate(Test_result = ifelse(p_value <= 0.05, "Reject Null", "Fail to reject Null")) %>%
    mutate(Interpretation = ifelse(p_value > 0.05, "Residuals normally distributed", "Residuals not normally distributed")) %>% rename("p value" = p_value, "Test Result" = Test_result)
  normm
  
}