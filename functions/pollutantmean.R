pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
        
        ## Search the file named "specdata", include document with .cvs 
        ## pattern, then store each files by their names
        files <- (Sys.glob("specdata//*.csv"))[id];
        
        ## Initialising a vector to store values
        pollutant_combined <-c()
        
        ## for loop that loops through each data file
        for (file in files){
                file_data <- read.csv(file,sep = ",")
                
                ## Select our column
                pollutant_data <- file_data[,pollutant]
                
                ## Ignore NAs
                pollutant_data <- pollutant_data[!is.na(pollutant_data)]
                
                ## append to our vector
                pollutant_combined <- c(pollutant_combined,pollutant_data)
        }
        
        ## Return the value
        return (mean(pollutant_combined))
}