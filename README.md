# Getting and Cleaning Data Course Project

## Downloading the data

```bash
make data
```

## Run the analysis

Once the `make data` command has downloaded and staged the data, all the
analyses are run via the `run_analysis.R` script.

```bash
make tidy
```

This will execute the command `R -q -f run_analysis.R` which pulls it the
original data sets, cleans, and merges them.

A tidy data set in written out to `tidyData.txt`

## Codebook

See the CodeBook.md for information on the tidy data.


# Problem Statement

The purpose of this project is to demonstrate your ability to collect, work
with, and clean a data set. The goal is to prepare tidy data that can be used
for later analysis. You will be graded by your peers on a series of yes/no
questions related to the project. You will be required to submit:

1. a tidy data set as described below
1. a link to a Github repository with your script for performing the analysis
1. a code book that describes the variables, the data, and any transformations
    or work that you performed to clean up the data called `CodeBook.md`.

You should also include a `README.md` in the repo with your scripts. This repo
explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable
computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most
advanced algorithms to attract new users. The data linked to from the course
website represent data collected from the accelerometers from the Samsung
Galaxy S smartphone. A full description is available at the site where the
data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

You should create one R script called `run_analysis.R` that does the following.

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard
    deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. Creates a second, independent tidy data set with the average of each
    variable for each activity and each subject.

Good luck!