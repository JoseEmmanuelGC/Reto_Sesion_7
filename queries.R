library(DBI)
library(RMySQL)
library(dplyr)
library(ggplot2)

MyDataBase <- dbConnect(
  drv= RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)

dbListFields(MyDataBase, 'CountryLanguage')


DataDB <- dbGetQuery(MyDataBase, "SELECT * FROM Country c JOIN CountryLanguage cl on c.Code=cl.CountryCode")
head(DataDB)

SP <-  DataDB %>% filter(Language == "Spanish")

SP.df <- as.data.frame(SP) 

SP.df %>% ggplot(aes( x = Name, y=Percentage, fill = IsOfficial )) + 
  geom_bin2d() +
  coord_flip()

