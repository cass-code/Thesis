lag <- function(log_data, maxlag){

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


a<- VARselect(log_QDP)
b<- VARselect(log_PREALWAPDP)
c<- VARselect(log_PREALWAPDNP)
d<- VARselect(log_YDISPREAL)

A<- as.data.frame(a$selection) %>% t() %>% as.data.frame()
B<- as.data.frame(b$selection) %>% t() %>% as.data.frame()
C<- as.data.frame(c$selection) %>% t() %>% as.data.frame()
D<- as.data.frame(d$selection) %>% t() %>% as.data.frame()

A
B
C
D
#
# l <- diff(log_data$log_QDP, differences = 1)
# m <- diff(log_data$log_PREALWAPDP, differences = 1)
# n <- diff(log_data$log_PREALWAPDNP, differences = 1)
# o <- diff(log_data$log_YDISPREAL, differences = 1)
#
# Q <- VARselect(l, lag.max=10)
# P <- VARselect(m, lag.max=10)
# N <- VARselect(n, lag.max=10)
# Y <- VARselect(o, lag.max=10)
#
# Q
# P
# N
# Y


# q <- diff(log_data$log_QDP, differences = 1)
# p <- diff(log_data$log_PREALWAPDP, differences = 1)
# n <- diff(log_data$log_PREALWAPDNP, differences = 1)
# y <- diff(log_data$log_YDISPREAL, differences = 1)
#
# diff <- cbind(q,p,n,y) %>% data.frame
#
# dat <- log_data %>% slice_head(n=98) %>% select_("DATE")
# log_data1 <- dat %>% cbind(diff)
#
# log_QDP <- ts(log_data1$q, start=c(2012, 1), end=c(2020, 3), frequency=12)
# log_PREALWAPDP <- ts(log_data1$p, start=c(2012, 1), end=c(2020, 3), frequency=12)
# log_PREALWAPDNP <- ts(log_data1$n, start=c(2012, 1), end=c(2020, 3), frequency=12)
# log_YDISPREAL <- ts(log_data1$y, start=c(2012, 1), end=c(2020, 3), frequency=12)


# Finding the optimal number of lags
bind <- cbind(log_QDP,log_PREALWAPDP, log_PREALWAPDNP, log_YDISPREAL)
colnames(bind) <- cbind("Quantity", "Real Price Legal", "Real Price Illegal", "Real Disposable Income")

lagselect <- VARselect(bind, lag.max = maxlag, type = "const")

# getting results in a nice format
l<- as.data.frame(lagselect$selection) %>% t() %>% as.data.frame()
    row.names(l) = c("Optimal Lags")
l

}

