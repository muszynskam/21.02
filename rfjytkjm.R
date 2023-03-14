library(modelr)
library(kableExtra)
library(ggplot2)
library(ggthemes)
library(dplyr)
library(knitr)
library(nycflights13)
library(forcats)
library(tidyverse)

get(wd)

smallpox <- read.csv("m23t1/GlobalSmallpoxCases.csv",
                     header = TRUE)
head(smallpox)
names (smallpox) [4] <- "cases"

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


#specify the basics
ggplot(smallpox, aes(x = cases, y = Year)) +
  geom_point() # add a layer of points
head(smallpox)

ggplot(smallpox, aes(y = cases, x = Year))+ geom_line(color = "skyblue", size = 1.5)+
  theme_tufte()
  
ggplot(heights, aes(y = education, x = income)) +
  geom_point() # add a layer of points
ggplot(heights, aes(x= education, y = income))+
  geom_jitter(width = 0.5, alpha = 0.2)+
  stat_summary(fun=mean, colour="red", geom="line", aes(group = 1))+
  theme_tufte()  
ggplot(heights, aes(x= education, y = income)) + geom_point()+ # add a layer of points +
  stat_summary(fun=mean, colour="red", geom="line", aes(group = 1))
   
ggplot(heights) + geom_point(aes(x = education, y = income), size = 0.6) +
  facet_wrap(~ sex, nrow = 2)

ggplot(heights, (aes(x = education, y = income, color = sex))) + geom_point() +
  stat_summary(fun=mean, geom="line", size= 2)

ggplot(heights, (aes(x = education, y = income, color = sex))) + geom_point(size = 0.6)  +
  facet_wrap(~ marital status, nrow = 2) + theme_tufte()

ggplot(heights, (aes(x = education, y = income, color = sex))) + geom_point() +
  stat_summary(fun=mean, geom="line", size= 2) + facet_wrap(~ sex, nrow = 2)

ggplot(heights, (aes(x = education, y = income, color = sex))) + geom_point() +
  stat_summary(fun=median, geom="line", size= 2) + facet_wrap(~ marital , nrow = 2)
head(heights)

ggplot(heights) + geom_point(aes(x = education, y = income), size = 0.6) +
  facet_wrap(~ sex, nrow = 2) + geom_smooth(x = education, y = income, size=0.2)+geom_point()+theme_tufte()

ggplot(heights,aes(x = education, y = income, color = sex)) +
  geom_smooth(size=0.2)+geom_point()+theme_tufte()

head(faithful)

ggplot(faithful, (aes(x = waiting, y = eruptions))) +
  geom_point() # add a layer of points

ggplot(heights, aes(x = class, y = hwy)) +
  geom_boxplot(size=0.2,alpha=0.2,outlier.size = 0.1) +
  theme_tufte() +
  theme(text = element_text(size=14))

ggplot(heights, aes(x = income, y = sex)) +
  geom_boxplot(size=0.2,alpha=0.2,outlier.size = 0.1) +
  theme_tufte() +
  theme(text = element_text(size=14))

head(flights) %>% kable("latex", booktabs = T, linesep = "") %>%
  kable_styling(latex_options = c("striped","scale_down", "HOLD_position")) %>%
  kable_styling(font_size = 14)

twoLast <- filter(flights, month == 11 | month == 12)
print(twoLast)


head(flights)


twoLast <- arrange(flights, dep_delay)
print(twoLast)

byDay <- group_by(flights, month,day)
delayByDay<- summarize(byDay, delay = mean(dep_delay, na.rm = TRUE))
head(delayByDay)

ggplot (delayByDay, aes(y= delay, x = 1:365)) + geom_line()

byDest <- group_by(flights,dest)
delay <- summarize(byDest,count=n(),
                   dist=mean(distance,na.rm=TRUE),
                   delay = mean(arr_delay,na.rm=TRUE))

delay <- filter(delay,count>20,dest !="HNL")
head(delay) 

ggplot(delay, aes(x =dist , y = delay , size = count)) +
  geom_point() + geom_smooth(se = FALSE, color = "skyblue")

head(diamonds)
gss_cat
head(gss_cat)

ggplot(gss_cat) +
  geom_bar(aes(x = race))
  
relig <- group_by(gss_cat, relig)
gss_cat <- summarize(byDest,count=n(),
                   dist=mean(distance,na.rm=TRUE),
                   delay = mean(arr_delay,na.rm=TRUE))
delay <- filter(delay,count>20,dest !="HNL")

head(gss_cat)
head(relig)

relig <- gss_cat %>%
  group_by(relig) %>%
  summarize( count=n(),
            meanage = mean(age, na.rm = TRUE), meantvh=(mean(tvhours, na.rm = TRUE))) 

ggplot(relig, aes(x=meantvh, y=relig)) + geom_point()

ggplot(relig, aes(x=tvhours, y=rincome)) + geom_point()


relig <- gss_cat %>% group_by(rincome)  %>%
  summarize(count=n(), meantvh=(mean(tvhours, na.rm = TRUE))) 



  ggplot(relig, aes(x=meantvh, y=rincome)) + geom_point() 







 