lag <- function(log_data){

library(vars)
library(tseries)
library(dplyr)

# a <- vars::VARselect(log_QDP, lag.max = 20)
# b <- vars::VARselect(log_PREALWAPDP, lag.max = 20)
# c <- vars::VARselect(log_PREALWAPDNP, lag.max = 20)
# d <- vars::VARselect(log_YDISPREAL, lag.max = 20)

# creating time series objects
log_QDP <- ts(log_data$log_QDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
log_PREALWAPDP <- ts(log_data$log_PREALWAPDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
log_PREALWAPDNP <- ts(log_data$log_PREALWAPDNP, start=c(2012, 1), end=c(2020, 3), frequency=12)
log_YDISPREAL <- ts(log_data$log_YDISPREAL, start=c(2012, 1), end=c(2020, 3), frequency=12)

# Finding the optimal number of lags
bind <- cbind(log_QDP,log_PREALWAPDP, log_PREALWAPDNP, log_YDISPREAL)
colnames(bind) <- cbind("Quantity", "Real Price Legal", "Real Price Illegal", "Real Disposable Income")
lagselect <- VARselect(bind, lag.max = 10, type = "both")

# getting results in a nice format
l<- as.data.frame(lagselect$selection) %>% t() %>% as.data.frame()
    row.names(l) = c("Optimal Lags")
l

}

