library(tseries)
adf.test(log_QDP, alternative="stationary", k=0)
plot(log_QDP)

lag.length = 25
Box.test(log_QDP, lag=lag.length, type="Ljung-Box") # test stationary signal
lag.length = 25
Box.test(log_PREALWAPDP, lag=lag.length, type="Ljung-Box") # test stationary signal

# testing for stationarity in individual series
library(urca)
library(tidyverse)
library(dplyr)
library(forecast)
library(tsm)
library(vars)
library(mFilter)
log_QDP %>% diff() %>% ur.kpss() %>% summary()
log_QDP %>% diff(lag=12) %>% ur.kpss() %>% summary()
x = ur.pp(log_data$log_QDP, type = "Z-tau", model="trend")
x
x@cval

log_QDP %>% diff() %>% plot()
log_QDP %>% plot()

# testing for cointegration
library(urca)
library(forecast)
library(tidyverse)
library(tseries)

dset <- cbind(log_PREALWAPDNP, log_PREALWAPDP, log_QDP, log_YDISPREAL)

# lag selection criteria

lagselect <- VARselect(dset, lag.max=10, type="const")
lagselect$selection

# choose 10 - 1 = 9 lags

# run Johansen test where null is that there is at least r cointegrating relationships
# if we reject H0 for r<= 0 then it means we reject that there is are 0 or less than zero cointegrating relationships
cjtest1 <- ca.jo(dset, type="trace", ecdet = "const", K=9) # if test value > than crit value REJECT NULL
summary(cjtest1) # both tests show that there is at least 3 cointegrating relationships
cjtest2 <- ca.jo(dset, type = "eigen", ecdet = "const", K=9) # for r<=1, test stat is 24.76 > 22.00 so reject at 5%
summary(cjtest2)
