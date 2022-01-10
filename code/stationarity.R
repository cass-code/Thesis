library(vars)
library(mFilter)
library(tseries)
library(TSstudio)
library(forecast)
library(tidyverse)

# creating time series objects
log_QDP <- ts(log_data$log_QDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
log_PREALWAPDP <- ts(log_data$log_PREALWAPDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
log_PREALWAPDNP <- ts(log_data$log_PREALWAPDNP, start=c(2012, 1), end=c(2020, 3), frequency=12)
log_YDISPREAL <- ts(log_data$log_YDISPREAL, start=c(2012, 1), end=c(2020, 3), frequency=12)

Q <- diff(log_QDP, differences = 1)
P <- diff(log_PREALWAPDP, differences = 1)
N <- diff(log_PREALWAPDNP, differences = 1)
Y <- diff(log_YDISPREAL, differences = 1)


autoplot(Q)
# Phillips Perron

pp.test(log_QDP)
pp.test(log_PREALWAPDP)
pp.test(log_PREALWAPDNP)
pp.test(log_YDISPREAL)

pp.test(Q)
pp.test(P)
pp.test(N)
pp.test(Y)


#kpss

kpss.test(log_QDP, null="Trend")
kpss.test(log_PREALWAPDP, null="Trend")
kpss.test(log_PREALWAPDNP, null="Trend")
kpss.test(log_YDISPREAL, null="Trend")

kpss.test(Q, null="Level")
kpss.test(Q, null="Trend")
kpss.test(P, null="Level")
kpss.test(, null="Trend")