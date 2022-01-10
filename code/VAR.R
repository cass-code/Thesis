VAR <- function(log_data, maxlag){

# Setting up Var

# loading required packages
library(tsm)
library(urca)
library(vars)
library(tseries)
library(tidyverse)
library(stargazer)
library(astsa)

    # creating time series objects
log_QDP <- ts(log_data$log_QDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
log_PREALWAPDP <- ts(log_data$log_PREALWAPDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
log_PREALWAPDNP <- ts(log_data$log_PREALWAPDNP, start=c(2012, 1), end=c(2020, 3), frequency=12)
log_YDISPREAL <- ts(log_data$log_YDISPREAL, start=c(2012, 1), end=c(2020, 3), frequency=12)

# plot(cbind(log_QDP, log_PREALWAPDNP, log_PREALWAPDP, log_YDISPREAL))
# Creating a time series plot of the logged variables
#autoplot(cbind(log_QDP,log_PREALWAPDP, log_PREALWAPDNP, log_YDISPREAL))

# Finding the optimal number of lags
bind <- cbind(log_QDP,log_PREALWAPDP, log_PREALWAPDNP, log_YDISPREAL)
colnames(bind) <- cbind("Quantity", "Price Duties Paid", "Price Duties not Paid", "Disposable Income")
lagselect <- VARselect(bind, lag.max = 10, type = "both")
lagselect$selection

model <- VAR(bind, p = 9, type = "none", season = NULL, exogen = NULL)
summary(model)
mod <- stargazer(model[["varresult"]], type = 'text')
mod


# roots(model, modulus=TRUE)
}
