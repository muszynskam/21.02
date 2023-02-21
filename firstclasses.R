library(modelr)
library(kableExtra)
library(ggplot2)
library(ggthemes)
library(dplyr)
library(knitr)
library(nycflights13)
library(forcats)
library(tidyverse)
smallpox <- read.csv("teachingData/CsvFiles/GlobalSmallpoxCases.csv",
                     header = TRUE)
getwd
smallpox <- read.csv("teachingData/CsvFiles/GlobalSmallpoxCases.csv",
                     header = TRUE)
get(wd)
smallpox <- read.csv("C:/Users/Student/Desktop/1/21.02",
                     header = TRUE)
smallpox <- read.csv("m23t1/GlobalSmallpoxCases.csv",
                     header = TRUE)
head(smallpox)
names (smallpox) [4] <- "cases"
names(smallpox)[4] <- "cases"
head(smallpox)
smallpox <- smallpox[,-2]
head(smallpox)
mean (smallpox$cases)
median (smallpox$cases)
mean(smallpox$cases[smallpox$Year > 1920])

mean(smallpox$cases[smallpox$Year < 1930])

mean(smallpox$cases[smallpox$Year >= 1920 & smallpox$Year <= 1930])
median(smallpox$cases[smallpox$Year >= 1920 & smallpox$Year <= 1930])
mean(smallpox$cases[smallpox$Year >= 1930 & smallpox$Year <= 1950])     
median(smallpox$cases[smallpox$Year >= 1930 & smallpox$Year <= 1950])
mean(smallpox$cases[smallpox$Year >= 1950 & smallpox$Year <= 1970])
median(smallpox$cases[smallpox$Year >= 1950 & smallpox$Year <= 1970])
