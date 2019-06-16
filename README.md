# cost_vs_cancer
Does a country's cancer rate correlate with cost of cigarettes? This question was posed on an Andriy Burkov LinkedIn [post](https://www.linkedin.com/feed/update/urn:li:activity:6545332858129563649) by Bryan Clark, after Andriy posted a data viz showing the cost of cigarettes in 13 countries.

To find out, I found a data set of cancer rates around the world from the [World Cancer Research Fund](https://www.wcrf.org/dietandcancer/cancer-trends/lung-cancer-statistics), which had rates for ten of the thirteen countries.

I applied a simple liner regression to the data set, trying to predict cancer rate from the cost.

```{r}
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
        #Result: Adjusted R-squared = 0.7432```


The result was an Adjusted R Squared value of 0.7432, which shows a fairly strong correlation.