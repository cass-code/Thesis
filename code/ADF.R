ADF <- function(log_data){

library(tseries)
library(stargazer)

a <- adf.test(log_data$log_QDP, k=10)
b <- adf.test(log_data$log_PREALWAPDP, k=10)
c <- adf.test(log_data$log_PREALWAPDNP, k=10)
d <- adf.test(log_data$log_YDISPREAL, k=10)

p_value <- c(round(a[[4]], 2), round(b[[4]],2), round(c[[4]],2), round(d[[4]],2))
Time_Series <- c('Cigarette Quantity', 'Real Price Legal', "Real Price Illegal", 'Real Disposable Income')
adf <- data.frame(Time_Series, p_value) %>% mutate(Test_result = ifelse(p_value <= 0.05, "Reject Null", "Fail to reject Null")) %>%
    mutate(Interpretation = ifelse(p_value > 0.05, "Non-stationary", "Stationary")) %>% rename("Time Series" = Time_Series, "p value" = p_value, "Test Result" = Test_result)
adf
}
