VEC <- function(log_data){

    library(tsDyn)
    library(urca)
    library(vars)
    library(tseries)
    library(tidyverse)
    library(stargazer)

    # creating time series objects
    log_QDP <- ts(log_data$log_QDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDP <- ts(log_data$log_PREALWAPDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDNP <- ts(log_data$log_PREALWAPDNP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_YDISPREAL <- ts(log_data$log_YDISPREAL, start=c(2012, 1), end=c(2020, 3), frequency=12)

    data <- cbind(log_QDP,log_PREALWAPDP, log_PREALWAPDNP, log_YDISPREAL)

    vecm <- VECM(data, 9, r=1, estim=("2OLS"))

    vecm[[2]]
    vecm[[6]]
    vecm[2]

   kk <-  data.frame(sum[["bigcoefficients"]], sum[["starslegend"]] )

   trns <-

    sum <- summary(vecm)
    r <- data.frame(sum[["qr"]])

    str(sum)
   k<-  data.frame(vecm[[2]])
   k
    # stargazer("sum", type="text")
}