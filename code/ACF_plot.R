ACF_plot <- function(log_data){


    plot.new()
    frame()
    par(mfcol=c(2,2))

    acf(log_data$QDP,lag.max = length(log_data$QDP),
        xlab = "lag", ylab = 'ACF',main='Cigarette Quantity ')
    acf(log_data$PREALWAPDP,lag.max = length(log_data$PREALWAPDP),
        xlab = "lag", ylab = 'ACF', main='Real Price Legal Cigarettes')
    acf(log_data$PREALWAPDNP,lag.max = length(log_data$PREALWAPDNP),
        xlab = "lag", ylab = 'ACF', main='Real Price Illegal Cigarettes')
    acf(log_data$YDISPREAL,lag.max = length(log_data$YDISPREAL),
        xlab = "lag", ylab = 'ACF', main='Real Disposable Income')



     library(tidyverse)
    library(gridExtra)
    library(grid)
    library(ggplot2)
    library(ggplotify)
    library(dplyr)

   Q <- acf(log_data$QDP,lag.max = length(log_data$QDP),
        xlab = "lag #", ylab = 'ACF',main='Cigarette Quantity ')
   PD <- acf(log_data$PREALWAPDP,lag.max = length(log_data$PREALWAPDP),
        xlab = "lag #", ylab = 'ACF', main='Real Price Legal Cigarettes')
   PDNP <-  acf(log_data$PREALWAPDNP,lag.max = length(log_data$PREALWAPDNP),
        xlab = "lag #", ylab = 'ACF', main='Real Price Illegal Cigarettes')
   YDIS <- acf(log_data$YDISPREAL,lag.max = length(log_data$YDISPREAL),
        xlab = "lag #", ylab = 'ACF', main='Real Disposable Income')

   g <-  grid.arrange(Q, PD, PDNP, YDIS, nrow=2, ncol=2)
   g
   }




