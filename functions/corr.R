corr <- function(directory, threshold = 0) {
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Returns a numeric vector of correlations
        
        files <- (Sys.glob("specdata//*.csv"));
        
        ## Initialize variables
        correlations <- c()
        
        for (file in files) {
                ## Load the data
                file_data <- read.csv(file, sep = ",");
                
                ## Calculate and store the count of complete cases
                complete_cases <- file_data[complete.cases(file_data),];
                
                ## if threshhold is reached
                if (nrow(complete_cases) > threshold) {
                        correlations <- c(correlations, cor(complete_cases$sulfate, complete_cases$nitrate))
                }
        }
        
        ## Return a numeric vector of correlations
        return(correlations)
}