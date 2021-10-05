ACF <- function(log_data){

    library(tsm)
    library(vars)
    library(mFilter)
    library(ggplot2)
    library(gridExtra)
    library(grid)
    library(dplyr)
   #library(oddsratio)
   #source("code/ac_kotze.R")


    # Creating the ACF data for each variable; saving the data as a data frame and then adding a column for the lags (this is needed for the graphing)
    QDP_acf <- as.data.frame(ac(log_data$log_QDP, main = "Quantity of Cigarettes")) %>% mutate(Lag = c(1:18))
    PREALWAPDP_acf <- as.data.frame(ac(log_data$log_PREALWAPDP, main = "Real Price of Legal Cigarettes")) %>% mutate(Lag = c(1:18))
    PREALWAPDNP_acf <- as.data.frame(ac(log_data$log_PREALWAPDNP, main = "Real Price of Illicit of Cigarettes")) %>% mutate(Lag = c(1:18))
    YDISPREAL_acf <- as.data.frame(ac(log_data$log_YDISPREAL, main = "Real Income")) %>% mutate(Lag = c(1:18))

    # ACF bar plots
    QDP_ACF <- ggplot(QDP_acf, aes(x=factor(Lag), y=ACF)) +
        geom_bar(stat = "identity", fill="#000050") +
        xlab("Lag") +
        ylab("ACF") +
        theme_classic() +
        ggtitle("Quantity of Cigarettes")

    PREALWAPDP_ACF <- ggplot(PREALWAPDP_acf, aes(x=factor(Lag), y=ACF)) +
        geom_bar(stat = "identity", fill="#000050") +
        xlab("Lag") +
        ylab("ACF") +
        theme_classic() +
        ggtitle("Real Price Legal Cigarettes")

    PREALWAPDNP_ACF <- ggplot(PREALWAPDNP_acf, aes(x=factor(Lag), y=ACF)) +
        geom_bar(stat = "identity", fill="#000050") +
        xlab("Lag") +
        ylab("ACF") +
        theme_classic() +
        ggtitle("Real Price Illicit Cigarettes")

    YDISPREAL_ACF <- ggplot(YDISPREAL_acf, aes(x=factor(Lag), y=ACF)) +
        geom_bar(stat = "identity", fill="#000050") +
        xlab("Lag") +
        ylab("ACF") +
        theme_classic() +
        ggtitle("Real Income")

    # Arranging the plots
    g <-  grid.arrange(QDP_ACF, PREALWAPDP_ACF, PREALWAPDNP_ACF, YDISPREAL_ACF, nrow=2, ncol=2)
    res=g
}