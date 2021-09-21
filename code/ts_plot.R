ts_plot <- function(log_data){

# libraries
library(tidyverse)
library(gridExtra)
library(grid)
library(ggplot2)
library(ggplotify)
library(dplyr)

# plotting the time series using ggplot2

    QDP_graph <- ggplot(log_data, aes(x=log_data$DATE, y=log_data$log_QDP)) +
        geom_line(color="#000050") +
        xlab("Year") +
        ylab("Cigarette sticks millions") +
        theme_classic() +
        ggtitle("Quantity of Cigarettes")

    PREALWAPDP_graph <- ggplot(log_data, aes(x=log_data$DATE, y=log_data$log_PREALWAPDP)) +
        geom_line(color="#000050") +
        xlab("Year") +
        ylab("Real Price of Legal Cigarettes") +
        theme_classic() +
        ggtitle("Real Price of Legal Cigarettes")

    PREALWAPDNP_graph <- ggplot(log_data, aes(x=log_data$DATE, y=log_data$log_PREALWAPDNP)) +
        geom_line(color="#000050") +
        xlab("Year") +
        ylab("Real Price of Illicit Cigarettes") +
        theme_classic() +
        ggtitle("Real Price of Illicit Cigarettes")

    YDISPREAL_graph <- ggplot(log_data, aes(x=log_data$DATE, y=log_data$log_YDISPREAL)) +
        geom_line(color="#000050") +
        xlab("Year") +
        ylab("Real Income") +
        theme_classic() +
        ggtitle("Real Income")

# arranging the plots

  g <-  grid.arrange(QDP_graph, PREALWAPDP_graph, PREALWAPDNP_graph, YDISPREAL_graph, nrow=2, ncol=2)
  g

}