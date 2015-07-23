## gacd_project
Course project for "Getting and Cleaning Data" course on Coursera

**To get the dataset into its "tidy" form, I performed the following manipulations on the data.  These steps are presented as a general outline, for more detail, please see my "run_analysis.R" script and embedded comments:**

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
