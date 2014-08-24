printf <- function(...)print(sprintf(...))

library(reshape2)

findFeatures <- function(all_features, grep_string) {
    grepl(grep_string, all_features$feature_name, fixed=TRUE)
}

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

activityLabels <- function() {
    read.table('activity_labels.txt', col.names=c('activity_id', 'activity_name'),
               colClasses=c('numeric', 'character'))
}


getTidy <- function() {
    labels <- activityLabels()

    features <- getFeatureList(subset=c('-mean()', '-std()'))
    # printf('Analyzing %d features like:', nrow(features))
    # print(head(features, 10))

    test_data <- getRawData('test', features$feature_id)
    train_data <- getRawData('train', features$feature_id)

    data <- rbind(test_data, train_data)
    colnames(data) <- c('subject', 'activity_id', features$feature_name)
    # print(str(data))

    dataMelt <- melt(data, id=c('subject', 'activity_id'), measure.vars=features$feature_name)

    tidyData <- dcast(dataMelt, subject + activity_id ~ variable, mean)
    merge(labels, tidyData, by="activity_id", all.x = TRUE)
}

tidyData <- getTidy()
write.table(tidyData,"tidyData.txt", row.name=FALSE)
