ACF_diff <- function(log_data){

    library(tidyverse)
    library(gridExtra)
    library(grid)
    library(ggplot2)
    library(ggplotify)
    library(dplyr)

    q <- diff(log_data$log_QDP, differences = 1)
    p <- diff(log_data$log_PREALWAPDP, differences = 1)
    n <- diff(log_data$log_PREALWAPDNP, differences = 1)
    y <- diff(log_data$log_YDISPREAL, differences = 1)

    plot.new()
    frame()
    par(mfcol=c(2,2))

    acf(q,lag.max = length(q),
        xlab = "lag", ylab = 'ACF',main='Cigarette Quantity ')
    acf(p,lag.max = length(p),
        xlab = "lag", ylab = 'ACF', main='Real Price Legal Cigarettes')
    acf(n,lag.max = length(n),
        xlab = "lag", ylab = 'ACF', main='Real Price Illegal Cigarettes')
    acf(y,lag.max = length(y),
        xlab = "lag", ylab = 'ACF', main='Real Disposable Income')

    Q <- acf(q,lag.max = length(q),
             xlab = "lag #", ylab = 'ACF',main='Cigarette Quantity ')
    PD <- acf(p,lag.max = length(p),
              xlab = "lag #", ylab = 'ACF', main='Real Price Legal Cigarettes')
    PDNP <-  acf(n,lag.max = length(n),
                 xlab = "lag #", ylab = 'ACF', main='Real Price Illegal Cigarettes')
    YDIS <- acf(y,lag.max = length(y),
                xlab = "lag #", ylab = 'ACF', main='Real Disposable Income')

    g <-  grid.arrange(Q, PD, PDNP, YDIS, nrow=2, ncol=2)
    g

}