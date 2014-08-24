printf <- function(...)print(sprintf(...))

findFeatures <- function(all_features, grep_string) {
    grepl(grep_string, all_features$feature_name, fixed=TRUE)
}

getFeatureList <- function(subset) {
    all_features <- read.table('UCI HAR Dataset/features.txt',
                               col.names=c('feature_id', 'feature_name'),
                               colClasses=c('integer', 'character'))
    sub_features = rep(FALSE, nrow(all_features))
    for (grep_string in subset) {
        sub_features <- sub_features | findFeatures(all_features, grep_string)
    }
    all_features[sub_features, ]
}

getRawData <- function(group, cols) {
    X <- read.table(paste('UCI HAR Dataset/', group, '/X_', group, '.txt', sep=""),
                    col.names=1:561,
                    colClasses=rep('numeric', 561))[, cols]
    y <- read.table(paste('UCI HAR Dataset/', group, '/y_', group, '.txt', sep=""),
                    col.names=c('y'),
                    colClasses=c('integer'))
    subject <- read.table(paste('UCI HAR Dataset/', group, '/subject_', group, '.txt', sep=""),
                    col.names=c('subject'),
                    colClasses=c('integer'))
    cbind(subject, y, X)
}

features <- getFeatureList(subset=c('-mean()', '-std()'))
printf('Analyzing %d features like:', nrow(features))
print(head(features, 10))

test_data <- getRawData('test', features$feature_id)
train_data <- getRawData('train', features$feature_id)

data <- rbind(test_data, train_data)
colnames(data) <- c('subject', 'y', features$feature_name)
print(str(data))