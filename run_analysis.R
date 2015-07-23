# "Getting and Cleaning Data" Course Project
# coded by Derek J, July 2015
#
# This script performs the following steps (indicated in the code by comments
# in ALL CAPS to make grading easier):
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
#

# Download the file containing the data set:

download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile="the_data.zip",
              method="curl")

# Unzip the downloaded file into the current directory:

unzip("the_data.zip")

# Change working directory to the directory containing the data:

setwd("UCI HAR Dataset")

# Load the 'data.table' and 'dplyr' packages (we will use some of the functions
# included in these packages):

library(data.table)
library(dplyr)

# Read required metadata (the activity labels and the feature labels) into R
# objects:

activity_labels <- read.table(file = "activity_labels.txt",
                              sep = " ",
                              col.names = c("code", "activity"),
                              colClasses = c("integer", "character"))
features <- read.table(file = "features.txt",
                       sep = " ",
                       col.names = c("code", "feature"),
                       colClasses = c("numeric", "character"))
features$feature <- gsub("-", ".", features$feature)
features$feature <- gsub("\\()", "", features$feature) #removes characters that confuse R

# Read all the needed files from the test data set into R objects:

subject_test <- fread(input = "./test/subject_test.txt",
                      data.table = FALSE)
x_test <- read.table(file = "./test/x_test.txt")
y_test <- read.table(file = "./test/y_test.txt")

# Convert the numerical activity labels into meaningful word labels, using the
# activity labels provided with the data set (The 'for' loop replaces numerical
# values in "y_test" with their corresponding character values in
# "activity_labels" (THIS CODE ACCOMPLISHES STEP 3, COMPLETE RESULT SEEN AFTER
# ALL SUBSEQUENT CONCATENATION/MANIPULATION):

test_windows <- length(y_test[,1])
for(i in 1:test_windows){
    y_test[i,1] <- activity_labels[y_test[i,1],2]
}

# Concatenate all the test data into a single data frame:

test_data <- cbind(subject_test, y_test, x_test)

# Apply appropriate names to the data (based on the labels given in
# "features.txt") THIS CODE ACCOMPLISHES STEP 4, COMPLETE RESULT SEEN AFTER ALL
# SUBSEQUENT CONCATENATION/MANIPULATION:

names(test_data) <- c(c("Subject", "Activity"), features[,2])

# Now repeat the above process for the training data:

subject_train <- fread(input = "./train/subject_train.txt",
                       data.table = FALSE)
x_train <- read.table(file = "./train/x_train.txt")
y_train <- read.table(file = "./train/y_train.txt")
train_windows <- length(y_train[,1])
for(i in 1:train_windows){
    y_train[i,1] <- activity_labels[y_train[i,1],2]
}
train_data <- cbind(subject_train, y_train, x_train)
names(train_data) <- c(c("Subject", "Activity"), features[,2])

# Concatenate the test data and the training data (THIS CODE COMPLETES STEP 1):

all_data <- rbind(test_data, train_data)

# Remove unwanted variables from the data (only keep variables that include
# "mean" or "std" in the feature label, but of course keep the 'Subject' and
# 'Activity' identifiers) THIS CODE COMPLETES STEP 2:

indices <- sort(c(1,
                  2,
                  grep("mean", names(all_data)),
                  grep("std", names(all_data))))
the_data <- all_data[,indices]

# Build our second tidy data set (means of feature variables, by Subject and by
# Activity):

# Calculate and tabulate the means of each variable by Subject and Activity:
# 
# In order to accomplish this, I coded nested 'for' loops to iterate through
# each subject and each variable, and then used 'tapply' to calculate the mean
# for each variable by activity.  I'm sure there is a more elegant way of doing
# this, and I am hoping to find out what that is during the peer grading...
#
# THIS CODE COMPLETES STEP 5:

num_vars <- ncol(the_data) 
tidy_data <- NULL # initialize the tidy_data matrix, will be building "chunks"
                  # and adding them as we iterate through the loops
for(i in 1:30){ # one iteration for each subject
    subj_data <- filter(the_data, Subject == i) # filter out by current subject
    chunk <- cbind(rep(i, 6), sort(unique(the_data$Activity))) # initialize
                                                            # this "chunk"
    for(j in 3:num_vars){ # one iteration for each time/frequency variable
        new_col <- tapply(subj_data[,j], subj_data$Activity, mean)
        chunk <- cbind(chunk, new_col) #build this subject's "chunk"
    }
    tidy_data <- rbind(tidy_data, chunk) # add current subject's "chunk" to the
                                        # rest of the data
}
rownames(tidy_data) <- NULL # gets rid of redundant row labels
tidy_data <- as.data.frame(tidy_data) # converts the matrix to a data frame
names(tidy_data)[3:81] <- paste0("avg.", names(the_data)[3:81]) # applies
                                                #meaningful variable name labels

# Remove unnecessary variables and data from the workspace:

unnec <- c("activity_labels", "features", "i", "j", "subject_test",
           "subject_train", "subj_data", "chunk", "new_col", "num_vars",
           "test_data", "test_windows", "train_data", "train_windows", "x_test",
           "x_train", "y_test", "y_train", "indices", "all_data", "unnec")
rm(list=unnec)

# Change back to previous working directory:

setwd("..")

# Export the tidy data set to a .txt file per project instructions:

write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)
