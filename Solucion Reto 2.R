library(rvest)

theurl <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
file <- read_html(theurl)

tables <- html_nodes(file, "table")  

table1 <- html_table(tables[1], fill = TRUE)

table <- na.omit(as.data.frame(table1))

table$Sueldo <- gsub("[MXN/mes$),]", "", table$Sueldo)

table$Sueldo <- as.numeric(table$Sueldo)

table[which.max(table$Sueldo), ]

table[which.min(table$Sueldo), ]
