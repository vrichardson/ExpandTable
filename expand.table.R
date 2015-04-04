

RH40 <- read.csv("C:/Users/Vrichardson/Dropbox/R projects/expand.table/Data/RH40.csv", header=FALSE, stringsAsFactors = FALSE,na.strings = "#N/A")
RH55 <- read.csv("C:/Users/Vrichardson/Dropbox/R projects/expand.table/Data/RH55.csv", header=FALSE, stringsAsFactors = FALSE,na.strings = "#N/A")
RH78 <- read.csv("C:/Users/Vrichardson/Dropbox/R projects/expand.table/Data/RH78.csv", header=FALSE, stringsAsFactors = FALSE,na.strings = "#N/A")




expand.table <- function(t){
        vnames <- t[2:nrow(t),1] 
        hnames <- t[1,2:ncol(t)]
        
}

vhlookup <- function(t,v,h){
        
        vlookup <- t[,1]==v
        hlookup <- t[1,]==h
        
        return(t[vlookup,hlookup])
