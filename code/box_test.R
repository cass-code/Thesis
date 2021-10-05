box_test <- function(log_data){

library(dplyr)
a <- Box.test(log_data$QDP, lag=10, type="Ljung-Box")
b <- Box.test(log_data$PREALWAPDP, lag=10, type="Ljung-Box")
c <- Box.test(log_data$PREALWAPDNP, lag=10, type="Ljung-Box")
d <- Box.test(log_data$YDISPREAL, lag=10, type="Ljung-Box")

p_value <- c(round(a[[3]], 2), round(b[[3]],2), round(c[[3]],2), round(d[[3]],2))
Time_Series <- c('Cigarette Quantity', 'Real Price Legal', "Real Price Illegal", 'Real Disposable Income')
box <- data.frame(Time_Series, p_value) %>% mutate(Test_result = ifelse(p_value < 0.05, "Reject Null", "Fail to reject Null")) %>%
        mutate(Interpretation = ifelse(p_value < 0.05, "Non-stationary", "Stationary")) %>% rename("Time Series" = Time_Series, "p value" = p_value, "Test Result" = Test_result)
box
}

