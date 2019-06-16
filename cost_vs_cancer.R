# COST VS CANCER

# This script attempts to find out if there's a correlation between the average
# cost of a packet of cigarettes in a country, and that country's cancer rate.
# Data for cigarette cost comes from Andriy Burkov's LinkedIn
# [post](https://www.linkedin.com/feed/update/urn:li:activity:6545332858129563649),
# which in turn cites numbeo.com. Data for cancer rate comes from the World
# Cancer Research Fund's [lung cancer
# statistics](https://www.wcrf.org/dietandcancer/cancer-trends/lung-cancer-statistics)


#0) PREPARE ENVIRONMENT --------------------------------------------------------
    #Clear environment
    rm(list = ls() ) # Clear global environment
    if ( names("dev.cur") != "null device") { dev.off() } #Clear plots
    cat("\013") #Clear console
    gc() #Clear memory
    
    #Load libraries
    library(tidyverse)

#1) GET DATA -------------------------------------------------------------------

    df <- tibble(rank = c(1, 2, 3, 4, 5, 7, 10, 16, 18, 20),
                 country = c("Australia", "New Zealand", "Ireland", "Norway", 
                             "UK", "Canada", "France", "Germany ", "US", 
                             "Denmark"),
                 cost = c(16.78, 14.81, 11.5, 11.4, 10.59, 8.56, 7.30, 6.3, 6, 
                          5.9),
                 cancer_rate = c(23.6, 26.4, 33.7, 29.2, 32.5, 29.3, 36.1, 33.7, 
                                 35.1, 36.6)
                 )

#2) FIT MODEL ------------------------------------------------------------------
    
    fit <- lm(cancer_rate ~ cost, data = df)
    summary(fit)
        #Result: Adjusted R-squared = 0.7432