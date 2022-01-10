box_diff <- function(log_data){

    library(dplyr)

    # creating time series objects
    log_QDP <- ts(log_data$log_QDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDP <- ts(log_data$log_PREALWAPDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDNP <- ts(log_data$log_PREALWAPDNP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_YDISPREAL <- ts(log_data$log_YDISPREAL, start=c(2012, 1), end=c(2020, 3), frequency=12)

    Q <- diff(log_QDP, differences = 1)
    P <- diff(log_PREALWAPDP, differences = 1)
    N <- diff(log_PREALWAPDNP, differences = 1)
    Y <- diff(log_YDISPREAL, differences = 1)

    a <- Box.test(Q, lag=10, type="Ljung-Box")
    b <- Box.test(P, lag=1, type="Ljung-Box")
    c <- Box.test(N, lag=6, type="Ljung-Box")
    d <- Box.test(Y, lag=4, type="Ljung-Box")

    p_value <- c(round(a[[3]], 2), round(b[[3]],2), round(c[[3]],2), round(d[[3]],2))
    Time_Series <- c('Cigarette Quantity', 'Real Price Legal', "Real Price Illegal", 'Real Disposable Income')
    box <- data.frame(Time_Series, p_value) %>% mutate(Test_result = ifelse(p_value < 0.05, "Reject Null", "Fail to reject Null")) %>%
        mutate(Interpretation = ifelse(p_value < 0.05, "Non-stationary", "Stationary")) %>% rename("Time Series" = Time_Series, "p value" = p_value, "Test Result" = Test_result)
    box
}

