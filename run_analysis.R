#' This script takes the original data set from the
#' Human Activity Recognition Using Smartphones Dataset project
#' and produces a "tidy" dataset of data containing a subset of the original
#' data that has been averaged down to a single value per metric per
#' subject per activity type.
#' The "tidy" data set is written out to tidyData.txt in the current
#' working directory.
#'
#' @name run_analysis
#' @author Daniel Robert Couture
#' @date 2014-08-24
#'
NULL

printf <- function(...)print(sprintf(...))

library(reshape2)


#' This function searches the full list of features for names
#' that contain the desired substring.
#'
#' @param all_features A vector of all the feature names possible
#' @param grep_string A substring the desired features should contain
#' @return Logical vector with True for features that contain the substring
findFeatures <- function(all_features, grep_string) {
    grepl(grep_string, all_features$feature_name, fixed=TRUE)
}

#' Take the full list of available features from features.txt and
#' only select ones that have names that match one of the provided
#' substrings in subset.
#'
#' @param subset A character vector with substrings to filter for
#' @return data.frame with the feature_id and the feature name for the
#'         subset of features
getFeatureList <- function(subset) {
    all_features <- read.table('features.txt',
                               col.names=c('feature_id', 'feature_name'),
                               colClasses=c('integer', 'character'))
    sub_features = rep(FALSE, nrow(all_features))
    for (grep_string in subset) {
        sub_features <- sub_features | findFeatures(all_features, grep_string)
    }
    all_features[sub_features, ]
}

#' Load either the test or training data sets.
#'
#' @param group Specify either "test" or "train"
#' @param cols Integer vector containing the feature_ids to return
#' @return data.frame with the subset of measurement and associated
#'         activity_id and subject id.
getRawData <- function(group, cols) {
    X <- read.table(paste(group, '/X_', group, '.txt', sep=""),
                    col.names=1:561,
                    colClasses=rep('numeric', 561))[, cols]
    activity_id <- read.table(paste(group, '/y_', group, '.txt', sep=""),
                    col.names=c('activity_id'),
                    colClasses=c('integer'))
    subject <- read.table(paste(group, '/subject_', group, '.txt', sep=""),
                    col.names=c('subject'),
                    colClasses=c('integer'))
    cbind(subject, activity_id, X)
}

#' Load the key value table for activity id and name
#'
#' @return data.frame that maps activity id to human readable name
activityLabels <- function() {
    read.table('activity_labels.txt', col.names=c('activity_id', 'activity_name'),
               colClasses=c('numeric', 'character'))
}

#' Full method to obtain the tidy data set from the original test and
#' training sets.
#'
#' @return data.frame with the tidy data.
getTidy <- function() {
    # Retrieve the key=>values for activity id and name
    labels <- activityLabels()

    # Get all mean and standard deviation features.
    features <- getFeatureList(subset=c('-mean()', '-std()'))
    # printf('Analyzing %d features like:', nrow(features))
    # print(head(features, 10))

    # Load the test data set
    test_data <- getRawData('test', features$feature_id)
    # Load the training data set
    train_data <- getRawData('train', features$feature_id)

    # Merge testing and training together
    data <- rbind(test_data, train_data)
    # Make sure the first columns for subject id and activity id are labeled
    colnames(data) <- c('subject', 'activity_id', features$feature_name)
    # print(str(data))

    # Identify the identifier fields vs the remaining measurement fields
    dataMelt <- melt(data, id=c('subject', 'activity_id'), measure.vars=features$feature_name)

    # Reduce the data set to a single record per subject per activity type.  Metrics
    # should be combined via the arithmetic mean
    tidyData <- dcast(dataMelt, subject + activity_id ~ variable, mean)

    # Add the human readable activity names to the reduced data set.
    merge(labels, tidyData, by="activity_id", all.x = TRUE)
}

# Get the tidy data set
tidyData <- getTidy()
# Write the data set to disk
write.table(tidyData,"tidyData.txt", row.name=FALSE)
