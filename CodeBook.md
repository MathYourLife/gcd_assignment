# Getting and Cleaning Data CodeBook
## Human Activity Recognition Using Smartphones Dataset

[project website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data from the `test` and `training` data sets were merged together from the
original data set.  The data set was summarized to one record per subject
per activity type with the measurements combined via the arithmetic mean.

### Tidy Dataset

The tidy data set is located in [tidyData.txt](tidyData.txt)

#### Tidy Dataset Identifiers

**activity_id** (integer)
Integer key for the activity (1-6)

* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

**activity_name** (character)
The human readable activity name

**subject** (integer)
The number to identify a specific subject (1-30)

#### Tidy Dataset Measurements

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  Each signal
has a calculated mean and standard deviation denoted by `-mean()` and `-std()`
respectively.

```
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
```

**Full list of measurements**

**tBodyAcc-mean()-X** (numeric)

**tBodyAcc-mean()-Y** (numeric)

**tBodyAcc-mean()-Z** (numeric)

**tBodyAcc-std()-X** (numeric)

**tBodyAcc-std()-Y** (numeric)

**tBodyAcc-std()-Z** (numeric)

**tGravityAcc-mean()-X** (numeric)

**tGravityAcc-mean()-Y** (numeric)

**tGravityAcc-mean()-Z** (numeric)

**tGravityAcc-std()-X** (numeric)

**tGravityAcc-std()-Y** (numeric)

**tGravityAcc-std()-Z** (numeric)

**tBodyAccJerk-mean()-X** (numeric)

**tBodyAccJerk-mean()-Y** (numeric)

**tBodyAccJerk-mean()-Z** (numeric)

**tBodyAccJerk-std()-X** (numeric)

**tBodyAccJerk-std()-Y** (numeric)

**tBodyAccJerk-std()-Z** (numeric)

**tBodyGyro-mean()-X** (numeric)

**tBodyGyro-mean()-Y** (numeric)

**tBodyGyro-mean()-Z** (numeric)

**tBodyGyro-std()-X** (numeric)

**tBodyGyro-std()-Y** (numeric)

**tBodyGyro-std()-Z** (numeric)

**tBodyGyroJerk-mean()-X** (numeric)

**tBodyGyroJerk-mean()-Y** (numeric)

**tBodyGyroJerk-mean()-Z** (numeric)

**tBodyGyroJerk-std()-X** (numeric)

**tBodyGyroJerk-std()-Y** (numeric)

**tBodyGyroJerk-std()-Z** (numeric)

**tBodyAccMag-mean()** (numeric)

**tBodyAccMag-std()** (numeric)

**tGravityAccMag-mean()** (numeric)

**tGravityAccMag-std()** (numeric)

**tBodyAccJerkMag-mean()** (numeric)

**tBodyAccJerkMag-std()** (numeric)

**tBodyGyroMag-mean()** (numeric)

**tBodyGyroMag-std()** (numeric)

**tBodyGyroJerkMag-mean()** (numeric)

**tBodyGyroJerkMag-std()** (numeric)

**fBodyAcc-mean()-X** (numeric)

**fBodyAcc-mean()-Y** (numeric)

**fBodyAcc-mean()-Z** (numeric)

**fBodyAcc-std()-X** (numeric)

**fBodyAcc-std()-Y** (numeric)

**fBodyAcc-std()-Z** (numeric)

**fBodyAccJerk-mean()-X** (numeric)

**fBodyAccJerk-mean()-Y** (numeric)

**fBodyAccJerk-mean()-Z** (numeric)

**fBodyAccJerk-std()-X** (numeric)

**fBodyAccJerk-std()-Y** (numeric)

**fBodyAccJerk-std()-Z** (numeric)

**fBodyGyro-mean()-X** (numeric)

**fBodyGyro-mean()-Y** (numeric)

**fBodyGyro-mean()-Z** (numeric)

**fBodyGyro-std()-X** (numeric)

**fBodyGyro-std()-Y** (numeric)

**fBodyGyro-std()-Z** (numeric)

**fBodyAccMag-mean()** (numeric)

**fBodyAccMag-std()** (numeric)

**fBodyBodyAccJerkMag-mean()** (numeric)

**fBodyBodyAccJerkMag-std()** (numeric)

**fBodyBodyGyroMag-mean()** (numeric)

**fBodyBodyGyroMag-std()** (numeric)

**fBodyBodyGyroJerkMag-mean()** (numeric)

**fBodyBodyGyroJerkMag-std()** (numeric)
