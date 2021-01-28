library(rvest)

theurl <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
file <- read_html(theurl)
# Selecciona pedazos dentro del HTML para identificar la tabla

tables <- html_nodes(file, "table")  
# Hay que analizar 'tables' para determinar cual es la posiciÃ³n en la lista 
# que contiene la tabla, en este caso es la no. 4

# Extraemos la tabla de acuerdo a la posiciÃ³n en la lista

table1 <- html_table(tables[1], fill = TRUE)

table <- na.omit(as.data.frame(table1))

table$Sueldo <- gsub("[MXN/mes$),]", "", table$Sueldo)

table$Sueldo <- as.numeric(table$Sueldo)

table[which.max(table$Sueldo), ]

table[which.min(table$Sueldo), ]
