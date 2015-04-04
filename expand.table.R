
makeSLists <- function(){
        # this code is problem specific
        
        
        #Read Files
        RH40 <- read.csv("C:/Users/Vrichardson/Dropbox/R projects/expand.table/Data/RH40.csv", header=FALSE, stringsAsFactors = FALSE,na.strings = "#N/A")
        RH55 <- read.csv("C:/Users/Vrichardson/Dropbox/R projects/expand.table/Data/RH55.csv", header=FALSE, stringsAsFactors = FALSE,na.strings = "#N/A")
        RS78 <- read.csv("C:/Users/Vrichardson/Dropbox/R projects/expand.table/Data/RS78.csv", header=FALSE, stringsAsFactors = FALSE,na.strings = "#N/A")
        
        #Create Col Names
        col.name.list<-c("Width","Height","Value")
        
        # Create List
        RH40List<-expand.table(RH40, col.name.list)
        RH55List<-expand.table(RH55, col.name.list)
        RS78List<-expand.table(RS78, col.name.list)
        
        #Write Files
        write.csv(RH40List,"C:/Users/Vrichardson/Dropbox/R projects/expand.table/Data/RH40List.csv",row.names = FALSE,na = "#N/A")
        write.csv(RH55List,"C:/Users/Vrichardson/Dropbox/R projects/expand.table/Data/RH55List.csv",row.names = FALSE,na = "#N/A")
        write.csv(RS78List,"C:/Users/Vrichardson/Dropbox/R projects/expand.table/Data/RS78List.csv",row.names = FALSE,na = "#N/A")
}




expand.table <- function(t, col.name.list){
        #This function takes a 2D table in a data frame where the 1st Row is the column lookup 
        #and the first column is the row. It returns a data frame with 3 columns the first being the row and the second the column,
        #the 3rd is the value found at the Row Col intersection in the initial table.
        
        
        # get col and row lookup values
        vnames <- as.numeric(t[2:nrow(t),1]) 
        hnames <- as.numeric(t[1,2:ncol(t)])
        
        #Create a list of all possible RC combinations
        tablelist<-expand.grid(vnames,hnames)
        
        #Create variable to hold values at intersections
        data <- 1:nrow(tablelist)
        
        # Find all intersecting values for each point
        
        for(i in 1:nrow(tablelist)){
                
                vlookup <- tablelist[i,1]
                hlookup <- tablelist[i,2]
                data[i] <- vhlookup(t,vlookup,hlookup)
        }
        
        # Combine into one table
        returnval <- cbind(tablelist,data)
        
        #Set Col Names
        colnames(returnval) <- col.name.list
        
        return(returnval)
}

vhlookup <- function(t,v,h){
        #This function looks up values on a 2D grid as per expand.table
        
        
        vlookup <- t[,1]==v
        hlookup <- t[1,]==h
        
        return(t[vlookup,hlookup])
}