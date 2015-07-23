##"Getting and Cleaning Data" course on Coursera
student:  Derek J., July 2015
________________________________________________________________________________
##This is my codebook for the tidy data set created for the course project.  It describes:

* PART 1 THE VARIABLES
* PART 2 THE DATA
* PART 3 TRANSFORMATIONS AND WORK PERFORMED TO CLEAN UP THE DATA

My tidy data set is called "tidy_data.txt".  The file can be read into R using:

    data <- read.table("tidy_data.txt", header = TRUE)
    
It conforms to the "tidy data principles" outlined in the course:

1. One variable per column
2. Each observation in its own row
________________________________________________________________________________

##PART 1: THE VARIABLES

The columns in the tidy data set each represent a variable.  Variables are described below (more information on how the measurements were determined can be found in the source publication - see PART 2: THE DATA):

Subject - unitless; identifies the subject (there were 30 subjects, identified
by an integer 1-30)

Activity - unitless; identifies the activity that the subject was performing,
identified by the following character strings:

* LAYING - subject was laying down
* SITTING - subject was sitting
* STANDING - subject was standing
* WALKING - subject was walking on a level surface
* WALKING_UPSTAIRS - subject was walking up stairs
* WALKING_DOWNSTAIRS - subject was walking down stairs

avg.tBodyAcc.mean.X:  unitless; average of the mean of the body linear
acceleration  in the X direction (time domain)

avg.tBodyAcc.mean.Y:  unitless; average of the mean of the body linear
acceleration  in the Y direction (time domain)

avg.tBodyAcc.mean.Z:  unitless; average of the mean of the body linear
acceleration  in the Z direction (time domain)

avg.tBodyAcc.std.X:  unitless; average of the standard deviation of the body
linear acceleration  in the X direction (time domain)

avg.tBodyAcc.std.Y:  unitless; average of the standard deviation of the body
linear acceleration  in the Y direction (time domain)

avg.tBodyAcc.std.Z:  unitless; average of the standard deviation of the body
linear acceleration  in the Z direction (time domain)

avg.tGravityAcc.mean.X:  unitless; average of the mean of the gravity linear
acceleration  in the X direction (time domain)

avg.tGravityAcc.mean.Y:  unitless; average of the mean of the gravity linear
acceleration  in the Y direction (time domain)

avg.tGravityAcc.mean.Z:  unitless; average of the mean of the gravity linear
acceleration  in the Z direction (time domain)

avg.tGravityAcc.std.X:  unitless; average of the standard deviation of the
gravity linear acceleration  in the X direction (time domain)

avg.tGravityAcc.std.Y:  unitless; average of the standard deviation of the
gravity linear acceleration  in the Y direction (time domain)

avg.tGravityAcc.std.Z:  unitless; average of the standard deviation of the
gravity linear acceleration  in the Z direction (time domain)

avg.tBodyAccJerk.mean.X:  unitless; average of the mean of the body linear
acceleration jerk signal in the X direction (time domain)

avg.tBodyAccJerk.mean.Y:  unitless; average of the mean of the body linear
acceleration jerk signal in the Y direction (time domain)

avg.tBodyAccJerk.mean.Z:  unitless; average of the mean of the body linear
acceleration jerk signal in the Z direction (time domain)

avg.tBodyAccJerk.std.X:  unitless; average of the standard deviation of the body
linear acceleration jerk signal in the X direction (time domain)

avg.tBodyAccJerk.std.Y:  unitless; average of the standard deviation of the body
linear acceleration jerk signal in the Y direction (time domain)

avg.tBodyAccJerk.std.Z:  unitless; average of the standard deviation of the body
linear acceleration jerk signal in the Z direction (time domain)

avg.tBodyGyro.mean.X:  unitless; average of the mean of the body angular
velocity  in the X direction (time domain)

avg.tBodyGyro.mean.Y:  unitless; average of the mean of the body angular
velocity  in the Y direction (time domain)

avg.tBodyGyro.mean.Z:  unitless; average of the mean of the body angular
velocity  in the Z direction (time domain)

avg.tBodyGyro.std.X:  unitless; average of the standard deviation of the body
angular velocity  in the X direction (time domain)

avg.tBodyGyro.std.Y:  unitless; average of the standard deviation of the body
angular velocity  in the Y direction (time domain)

avg.tBodyGyro.std.Z:  unitless; average of the standard deviation of the body
angular velocity  in the Z direction (time domain)

avg.tBodyGyroJerk.mean.X:  unitless; average of the mean of the body angular
velocity jerk signal in the X direction (time domain)

avg.tBodyGyroJerk.mean.Y:  unitless; average of the mean of the body angular
velocity jerk signal in the Y direction (time domain)

avg.tBodyGyroJerk.mean.Z:  unitless; average of the mean of the body angular
velocity jerk signal in the Z direction (time domain)

avg.tBodyGyroJerk.std.X:  unitless; average of the standard deviation of the
body angular velocity jerk signal in the X direction (time domain)

avg.tBodyGyroJerk.std.Y:  unitless; average of the standard deviation of the
body angular velocity jerk signal in the Y direction (time domain)

avg.tBodyGyroJerk.std.Z:  unitless; average of the standard deviation of the
body angular velocity jerk signal in the Z direction (time domain)

avg.tBodyAccMag.mean:  unitless; average of the mean of the body linear
acceleration  magnitude (time domain)

avg.tBodyAccMag.std:  unitless; average of the standard deviation of the body
linear acceleration  magnitude (time domain)

avg.tGravityAccMag.mean:  unitless; average of the mean of the gravity linear
acceleration  magnitude (time domain)

avg.tGravityAccMag.std:  unitless; average of the standard deviation of the
gravity linear acceleration  magnitude (time domain)

avg.tBodyAccJerkMag.mean:  unitless; average of the mean of the body linear
acceleration jerk signal magnitude (time domain)

avg.tBodyAccJerkMag.std:  unitless; average of the standard deviation of the
body linear acceleration jerk signal magnitude (time domain)

avg.tBodyGyroMag.mean:  unitless; average of the mean of the body angular
velocity  magnitude (time domain)

avg.tBodyGyroMag.std:  unitless; average of the standard deviation of the body
angular velocity  magnitude (time domain)

avg.tBodyGyroJerkMag.mean:  unitless; average of the mean of the body angular
velocity jerk signal magnitude (time domain)

avg.tBodyGyroJerkMag.std:  unitless; average of the standard deviation of the
body angular velocity jerk signal magnitude (time domain)

avg.fBodyAcc.mean.X:  unitless; average of the mean of the body linear
acceleration  in the X direction (frequency domain)

avg.fBodyAcc.mean.Y:  unitless; average of the mean of the body linear
acceleration  in the Y direction (frequency domain)

avg.fBodyAcc.mean.Z:  unitless; average of the mean of the body linear
acceleration  in the Z direction (frequency domain)

avg.fBodyAcc.std.X:  unitless; average of the standard deviation of the body
linear acceleration  in the X direction (time domain)

avg.fBodyAcc.std.Y:  unitless; average of the standard deviation of the body
linear acceleration  in the Y direction (time domain)

avg.fBodyAcc.std.Z:  unitless; average of the standard deviation of the body
linear acceleration  in the Z direction (time domain)

avg.fBodyAcc.meanFreq.X:  unitless; average of the mean of the body linear
acceleration  in the X direction (frequency domain)

avg.fBodyAcc.meanFreq.Y:  unitless; average of the mean of the body linear
acceleration  in the Y direction (frequency domain)

avg.fBodyAcc.meanFreq.Z:  unitless; average of the mean of the body linear
acceleration  in the Z direction (frequency domain)

avg.fBodyAccJerk.mean.X:  unitless; average of the mean of the body linear
acceleration jerk signal in the X direction (frequency domain)

avg.fBodyAccJerk.mean.Y:  unitless; average of the mean of the body linear
acceleration jerk signal in the Y direction (frequency domain)

avg.fBodyAccJerk.mean.Z:  unitless; average of the mean of the body linear
acceleration jerk signal in the Z direction (frequency domain)

avg.fBodyAccJerk.std.X:  unitless; average of the standard deviation of the body
linear acceleration jerk signal in the X direction (time domain)

avg.fBodyAccJerk.std.Y:  unitless; average of the standard deviation of the body
linear acceleration jerk signal in the Y direction (time domain)

avg.fBodyAccJerk.std.Z:  unitless; average of the standard deviation of the body
linear acceleration jerk signal in the Z direction (time domain)

avg.fBodyAccJerk.meanFreq.X:  unitless; average of the mean of the body linear
acceleration jerk signal in the X direction (frequency domain)

avg.fBodyAccJerk.meanFreq.Y:  unitless; average of the mean of the body linear
acceleration jerk signal in the Y direction (frequency domain)

avg.fBodyAccJerk.meanFreq.Z:  unitless; average of the mean of the body linear
acceleration jerk signal in the Z direction (frequency domain)

avg.fBodyGyro.mean.X:  unitless; average of the mean of the body angular
velocity  in the X direction (frequency domain)

avg.fBodyGyro.mean.Y:  unitless; average of the mean of the body angular
velocity  in the Y direction (frequency domain)

avg.fBodyGyro.mean.Z:  unitless; average of the mean of the body angular
velocity  in the Z direction (frequency domain)

avg.fBodyGyro.std.X:  unitless; average of the standard deviation of the body
angular velocity  in the X direction (time domain)

avg.fBodyGyro.std.Y:  unitless; average of the standard deviation of the body
angular velocity  in the Y direction (time domain)

avg.fBodyGyro.std.Z:  unitless; average of the standard deviation of the body
angular velocity  in the Z direction (time domain)

avg.fBodyGyro.meanFreq.X:  unitless; average of the mean of the body angular
velocity  in the X direction (frequency domain)

avg.fBodyGyro.meanFreq.Y:  unitless; average of the mean of the body angular
velocity  in the Y direction (frequency domain)

avg.fBodyGyro.meanFreq.Z:  unitless; average of the mean of the body angular
velocity  in the Z direction (frequency domain)

avg.fBodyAccMag.mean:  unitless; average of the mean of the body linear
acceleration  magnitude (frequency domain)

avg.fBodyAccMag.std:  unitless; average of the standard deviation of the body
linear acceleration  magnitude (time domain)

avg.fBodyAccMag.meanFreq:  unitless; average of the mean of the body linear
acceleration  magnitude (frequency domain)

avg.fBodyBodyAccJerkMag.mean:  unitless; average of the mean of the body linear
acceleration jerk signal magnitude (frequency domain)

avg.fBodyBodyAccJerkMag.std:  unitless; average of the standard deviation of the
body linear acceleration jerk signal magnitude (time domain)

avg.fBodyBodyAccJerkMag.meanFreq:  unitless; average of the mean of the body
linear acceleration jerk signal magnitude (frequency domain)

avg.fBodyBodyGyroMag.mean:  unitless; average of the mean of the body angular
velocity  magnitude (frequency domain)

avg.fBodyBodyGyroMag.std:  unitless; average of the standard deviation of the
body angular velocity  magnitude (time domain)

avg.fBodyBodyGyroMag.meanFreq:  unitless; average of the mean of the body
angular velocity  magnitude (frequency domain)

avg.fBodyBodyGyroJerkMag.mean:  unitless; average of the mean of the body
angular velocity jerk signal magnitude (frequency domain)

avg.fBodyBodyGyroJerkMag.std:  unitless; average of the standard deviation of
the body angular velocity jerk signal magnitude (time domain)

avg.fBodyBodyGyroJerkMag.meanFreq:  unitless; average of the mean of the body
angular velocity jerk signal magnitude (frequency domain)
________________________________________________________________________________
##PART 2: THE DATA

The data for this project was obtained from the following publication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L.
Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass
Hardware-Friendly Support Vector Machine. International Workshop of Ambient
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The data can be accessed at the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Further information on the "Human Activity Recognition Using Smartphones" project can be found at:

www.smartlab.ws
________________________________________________________________________________
##PART 3: MANIPULATIONS AND TRANSFORMATIONS

To get the dataset into its "tidy" form, I performed the following manipulations on the data.  These steps are presented as a general outline, for more detail, please see my "run_analysis.R" script and embedded comments:

1. Downloaded the data file at the URL referenced above in PART 2: THE DATA

2. Unzipped the data into the default directory structure given in the .zip file

3. Read the applicable metadata files into R ("features.txt" and
"activity_labels.txt")

4. Read the test data into R ("subject_test.txt", "x_test.txt", "y_test.txt")

5. Converted the numerical activity variable for each observation (given in
"y_test.txt") to descriptive character variables (using the labels given by
"activity_labels.txt")

6. Combined all of the test data into a single data frame

7. Applied column labels to each column ("Subject" for column 1, "Activity" for
column 2, and then used "features.txt" to generate appropriate variable names
for each of the other variables)

8. Read the training data into R ("subject_train.txt", "x_train.txt",
"y_train.txt")

9. Repeated steps 5 - 7 for the training data

10. Combined the test data and the training data into a single data frame

11. Removed all measurement variables that did not have "mean" or "std" in the
variable name

12. Calculated the average of each measurement variable for each unique
"Subject"-"Activity" pair, and compiled these averages into a data frame

13. Exported this data frame into "tidy_data.txt"
