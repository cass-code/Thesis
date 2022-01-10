ADF_diff <- function(log_data){

    library(tseries)
    library(stargazer)

    Q <- diff(log_data$log_QDP, differences = 1)
    P <- diff(log_data$log_PREALWAPDP, differences = 1)
    N <- diff(log_data$log_PREALWAPDNP, differences = 1)
    Y <- diff(log_data$log_YDISPREAL, differences = 1)

    a <- adf.test(Q, k=9)
    b <- adf.test(P, k=1)
    c <- adf.test(N, k=3)
    d <- adf.test(Y, k=2)

    p_value <- c(round(a[[4]], 2), round(b[[4]],2), round(c[[4]],2), round(d[[4]],2))
    lag <- c(a$parameter, b$parameter, c$parameter, d$parameter)
    Time_Series <- c('Cigarette Quantity', 'Real Price Legal', "Real Price Illegal", 'Real Disposable Income')
    adf <- data.frame(Time_Series, lag, p_value) %>% mutate(Test_result = ifelse(p_value <= 0.05, "Reject Null", "Fail to reject Null")) %>%
        mutate(Interpretation = ifelse(p_value > 0.05, "Non-stationary", "Stationary")) %>% rename("Time Series" = Time_Series, "p value" = p_value, "Test Result" = Test_result)
    adf
}
