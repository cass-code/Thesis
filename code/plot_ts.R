# Plot the time series
plot_ts <- function(log_data){

    # Calling necessary libraries
    library(tidyverse)
    library(vars)
    library(mFilter)
    library(tseries)
    library(TSstudio)
    library(forecast)
    library(tidyverse)
    library(gridExtra)
    library(grid)
    library(ggplot2)
    library(ggplotify)

    # creating time series objects (starting in the first month of 2012 and ending in the third month of 2020)
    log_QDP <- ts(log_data$log_QDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDP <- ts(log_data$log_PREALWAPDP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_PREALWAPDNP <- ts(log_data$log_PREALWAPDNP, start=c(2012, 1), end=c(2020, 3), frequency=12)
    log_YDISPREAL <- ts(log_data$log_YDISPREAL, start=c(2012, 1), end=c(2020, 3), frequency=12)

    # Plotting the individual time series
    QDP_graph <- as.grob(ts_plot(log_QDP))
    PREALWAPDNP_graph <- as.grob(ts_plot(log_PREALWAPDNP))
    PREALWAPDP_graph <- as.grob(ts_plot(log_PREALWAPDP))
    YDISPREAL_graph <- as.grob(ts_plot(log_YDISPREAL))

    # Arranging the time series graphs
    grid.arrange(QDP_graph, PREALWAPDP_graph, PREALWAPDNP_graph, YDISPREAL_graph, nrow=2, ncol=2)




}
