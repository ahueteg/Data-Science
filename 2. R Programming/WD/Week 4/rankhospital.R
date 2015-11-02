rankhospital <- function(stado, outcome, num) {
  datos <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  datos <- datos[c(2, 7, 11, 17, 23)]
  names(datos)[1] <- "name"
  names(datos)[2] <- "state"
  names(datos)[3] <- "heart attack"
  names(datos)[4] <- "heart failure"
  names(datos)[5] <- "pneumonia"
  outcomes = c("heart attack", "heart failure", "pneumonia")
  if( outcome %in% outcomes == FALSE ) stop("invalid outcome")
  stados <- datos[, 2]
  stados <- unique(stados)
  if( stado %in% stados == FALSE ) stop("invalid stado")
  if( num != "best" && num != "worst" && num%%1 != 0 ) stop("invalid num")
  datos <- datos[datos$state==stado & datos[outcome] != 'Not Available', ]
  datos[outcome] <- as.data.frame(sapply(datos[outcome], as.numeric))
  datos <- datos[order(datos$name, decreasing = FALSE), ]
  datos <- datos[order(datos[outcome], decreasing = FALSE), ]
  vals <- datos[, outcome]
  if( num == "best" ) {
    fila <- which.min(vals)
  } else if( num == "worst" ) {
    fila <- which.max(vals)
  } else {
    fila <- num
  }
  datos[fila, ]$name
} 
