
#' Pull a file down from the interwebs if it hasn't been already
#'
#' @param url Path to the source data
#' @param destfil Relative or absolute system path to where the data
#'                is to be saved
getdata <- function(url, destfile){
    print(paste('getting', destfile, sep=' '))
    method <- 'wget'
    if (!file.exists(destfile)) {
        # Specify the method of download
        download.file(url, destfile, method)
    } else {
        print(paste(destfile, 'is already fetched', sep=' '))
    }
}

url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
destfile <- 'UCIHARDataset.zip'
getdata(url, destfile)
