############################################
# global and setup
############################################
#install.packages('rpivotTable',dep=T)
#install.packages('ggvis',dep=T)
#install.packages("shinythemes",dep=T)
library(rpivotTable)
library(shiny)
library(ggvis)
library(dplyr)
library(shinydashboard)

# inital setup preprocess all CSV's to test how much data can handle
# 
# 
# temp = list.files(pattern="*.csv",recursive = T)
# temp
# 
# list2env(
#   lapply(setNames(temp, make.names(gsub("data/*","",gsub("*.csv$", "", temp)))), 
#          read.csv), envir = .GlobalEnv)
# 
# csvnames<-make.names(gsub("data/*","",gsub("*.csv$", "", temp)))
# str(csvnames)
# lapply(csvnames,function(x){
#   print(x)
#   saveRDS(file=paste("./data/",x,".rda",sep=""),get(x))
# })
# saveRDS(file=paste("./data/csvnames.rda",sep=""),csvnames)
# getwd()
# rdafiles = list.files(pattern="*.rda",recursive = T)

##################################
#initRead
##################################
csvnames<-readRDS("./data/csvnames.rda")
rdata<-readRDS("./data/births.rda")
