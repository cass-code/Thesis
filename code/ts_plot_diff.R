# Plot the time series
ts_plot_diff <- function(log_data){

        # libraries
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

        diff <- cbind(q,p,n,y) %>% data.frame

        dat <- log_data %>% slice_head(n=98) %>% select_("DATE")
        log_data1 <- dat %>% cbind(diff)


        # plotting the time series using ggplot2

        QDP_graph <- ggplot(log_data1, aes(x=DATE, y=q)) +
            geom_line(color="#000050") +
            xlab("Year") +
            ylab("Cigarette sticks millions") +
            theme_classic() +
            ggtitle("Quantity of Cigarettes")



        PREALWAPDP_graph <- ggplot(log_data1, aes(x=DATE, y=p)) +
            geom_line(color="#000050") +
            xlab("Year") +
            ylab("Real Price Legal Cigarettes") +
            theme_classic() +
            ggtitle("Real Price Legal Cigarettes")

        PREALWAPDNP_graph <- ggplot(log_data1, aes(x=DATE, y=n)) +
            geom_line(color="#000050") +
            xlab("Year") +
            ylab("Real Price Illicit Cigarettes") +
            theme_classic() +
            ggtitle("Real Price Illicit Cigarettes")

        YDISPREAL_graph <- ggplot(log_data1, aes(x=DATE, y=y)) +
            geom_line(color="#000050") +
            xlab("Year") +
            ylab("Real Disposable Income") +
            theme_classic() +
            ggtitle("Real Disposable Income")

        # arranging the plots

        g <-  grid.arrange(QDP_graph, PREALWAPDP_graph, PREALWAPDNP_graph, YDISPREAL_graph, nrow=2, ncol=2)
        g

}
