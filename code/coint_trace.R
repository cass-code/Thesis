coint_trace <- function(log_data){

    library(urca)
    library(tidyverse)
    library(tseries)
    library(dplyr)

    # creating time series objects
    log_QDP <- ts(log_data$log_QDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDP <- ts(log_data$log_PREALWAPDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDNP <- ts(log_data$log_PREALWAPDNP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_YDISPREAL <- ts(log_data$log_YDISPREAL, start=c(2012, 1), end=c(2020, 3), frequency=12)

    # testing for cointegration
    dset <- cbind(log_PREALWAPDNP, log_PREALWAPDP, log_QDP, log_YDISPREAL)

    # choose 10 - 1 = 9 lags

    # run Johansen test where null is that there is at least r cointegrating relationships
    # if we reject H0 for r<= 0 then it means we reject that there is are 0 or less than zero cointegrating relationships
    cjtest1 <- ca.jo(dset, type="trace", ecdet = "const", K=9) # if test value > than crit value REJECT NULL
    b <- summary(cjtest1)

    teststat <- data.frame(b@teststat)
    c<- data.frame(b@cval)

    f <- data.frame(teststat, c) %>% rename("Test Statistic" = b.teststat, "10%" = X10pct, "5%" = X5pct, "1%" = X1pct)

    row.names(f) <- c("r<=3", "r<=2", "r<=1", "r=0")
    f

}