pollutantmean <- function(directory, pollutant, id = 1:332) {
files<- list.files(directory)
dat <- data.frame()
  for(i in id) {
    path<-paste0(directory,"/",formatC(i, width = 3,flag = 0),".csv")
    print(path)
    #dat <- rbind(dat, read.csv(path))
  }
#mean(dat[, pollutant], na.rm = TRUE)
}